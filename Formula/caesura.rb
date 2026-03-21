class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.27.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.2/caesura-0.27.2-aarch64-apple-darwin.tar.xz"
      sha256 "c1aee9d6516fe2351da60f125da97d95b8ce921785f5f19b15cc3d53f8c58a79"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.2/caesura-0.27.2-x86_64-apple-darwin.tar.xz"
      sha256 "1ab1b4996d5d18ee0944d40ac839c64d72748c6a4711bc3cb54e0e3f3930ba21"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.2/caesura-0.27.2-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4c29a46388d32fe1cffaa36daba8d087280811687bba1fd0978b2b7650cc7357"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.2/caesura-0.27.2-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b7e438dcc1d4dafcbd051be61bce8f406f71ba9bdb84638571c436b7620cf04b"
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
