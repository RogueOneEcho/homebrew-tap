class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.27.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-aarch64-apple-darwin.tar.xz"
      sha256 "7bf822aca39657bb5f4b209d376adce8e1ddfaf1b255740f7d4179c6e9880831"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-x86_64-apple-darwin.tar.xz"
      sha256 "9f36f2ef53f46a0474c18ee0ded874e57f33ddfc885e915e3ce830260fb9d15f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cc1e6dceb28875056f2eac486b8ea1548c7122e609a84a65757e18c56af410d7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "90de01ef99f793a3f669613ee43a8a3c0b6c18f49fc985723241ce1e252a559f"
    end
  end

  depends_on "flac"
  depends_on "lame"
  depends_on "sox_ng"

  def install
    bin.install "caesura"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/caesura --version")
  end
end
