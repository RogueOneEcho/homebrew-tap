class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.32.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.32.0/caesura-0.32.0-aarch64-apple-darwin.tar.xz"
      sha256 "5619f83fda606a434751882f4286f455c305b4ec35ad810a7b1d0b4f39137c1f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.32.0/caesura-0.32.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9e553e2b9fcc77e3eb4434a1312f6ffdbc87e3b4c5844c9da134c3a2c54845ac"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.32.0/caesura-0.32.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b07e8e9f278c95f18d83a40fef3d7ae75a02d72803ad6bd6d78cd02d7ce3ff5f"
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
