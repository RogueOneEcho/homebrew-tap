# Homebrew Tap

Homebrew formulae for [RogueOneEcho](https://github.com/RogueOneEcho) projects.

## Installation

```bash
brew install rogueoneecho/tap/caesura
```

Or add the tap first:

```bash
brew tap rogueoneecho/tap
brew install caesura
```

## Available Formulae

- [**caesura**](Formula/caesura.rb) - CLI for transcoding FLAC audio and uploading to Gazelle-based trackers

## Updating Formulae

Local:

```bash
./scripts/update-formula.sh caesura 0.26.0
```

From CI:

```bash
gh workflow run update-formula.yml -R RogueOneEcho/homebrew-tap -f name=caesura -f version=0.26.0
```
