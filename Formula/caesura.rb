class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.30.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.0/caesura-0.30.0-aarch64-apple-darwin.tar.xz"
      sha256 "c892f838ae60cd2b57d93c4ee134158dce4eb7c63e814d505dc920e31a0c7e44"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.0/caesura-0.30.0-x86_64-apple-darwin.tar.xz"
      sha256 "71c903a9c900dce8658c035233d0c499a68b9ae84c27093edeefed2d3587589c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.0/caesura-0.30.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6b0454b6d283d333b8b174807f476e2a5b264491eb9812d687b916d5d4367130"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.0/caesura-0.30.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1d0706a75b7d6327d52d00009b38fddab453b33dc9282f8bbdac0c0e19e6e3fe"
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
