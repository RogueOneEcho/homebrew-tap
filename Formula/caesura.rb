class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.28.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.28.0/caesura-0.28.0-aarch64-apple-darwin.tar.xz"
      sha256 "bc2b97a154263e8d757c31caf5953b4ea4779bc422bcf8ed0c4fd3bac5dfc916"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.28.0/caesura-0.28.0-x86_64-apple-darwin.tar.xz"
      sha256 "d29ec7ace860c9d8c93ca1ba4431b2c950dce70376c0c5be5a8e192ec9b9a388"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.28.0/caesura-0.28.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ad3be564a473629c8d9c6cf9a3d5ec21d20565c1d4767e8c7396675bc5061930"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.28.0/caesura-0.28.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "88cbd338762d79d4e9de9e42a8381fbf98d50e1d68b8b1c491444ad86e462cc2"
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
