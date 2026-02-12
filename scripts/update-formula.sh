#!/usr/bin/env bash
set -euo pipefail

NAME="${1:-}"
VERSION="${2:-}"
REPO="${3:-RogueOneEcho/${NAME}}"
if [[ -z "$NAME" || -z "$VERSION" ]]; then
  echo "Usage: $0 <name> <version> [repo]"
  echo "Example: $0 caesura 0.26.0"
  exit 1
fi

REPO_ROOT="$(realpath "$(dirname "$0")/..")"
TEMPLATE="$REPO_ROOT/src/${NAME}.template.rb"
OUTPUT="$REPO_ROOT/Formula/${NAME}.rb"

echo "Updating $NAME to $VERSION from $REPO"

ASSETS=$(gh release view "v${VERSION}" --repo "$REPO" --json assets)
echo "Assets:"
echo "$ASSETS" | jq -r '.assets[] | "  \(.name)"'

TARGETS=(
  "aarch64-apple-darwin"
  "x86_64-apple-darwin"
  "aarch64-unknown-linux-gnu"
  "x86_64-unknown-linux-gnu"
)

get_os() {
  case "$1" in
    *apple-darwin*) echo "macos" ;;
    *linux*) echo "linux" ;;
  esac
}

get_arch() {
  case "$1" in
    aarch64-*) echo "arm" ;;
    x86_64-*) echo "intel" ;;
  esac
}

BLOCKS=""
for target in "${TARGETS[@]}"; do
  asset=$(echo "$ASSETS" | jq -r ".assets[] | select(.name | contains(\"${target}\"))")
  [[ -z "$asset" || "$asset" == "null" ]] && continue
  os=$(get_os "$target")
  arch=$(get_arch "$target")
  url=$(echo "$asset" | jq -r '.url')
  checksum=$(echo "$asset" | jq -r '.digest' | sed 's/sha256://')
  echo "$target: $checksum"
  BLOCKS+="  on_${os} do
    on_${arch} do
      url \"${url}\"
      sha256 \"${checksum}\"
    end
  end
"
done

CONTENT=$(<"$TEMPLATE")
CONTENT="${CONTENT/__VERSION__/$VERSION}"
CONTENT="${CONTENT/__PLATFORM_BLOCKS__/${BLOCKS%$'\n'}}"
echo "$CONTENT" > "$OUTPUT"

if grep -qE '__[A-Z0-9_]+__' "$OUTPUT"; then
  echo "Error: Formula contains unsubstituted placeholders"
  grep -E '__[A-Z0-9_]+__' "$OUTPUT"
  exit 1
fi

ruby -c "$OUTPUT"
echo "Formula updated: $OUTPUT"
