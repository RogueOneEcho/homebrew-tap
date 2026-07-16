class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.31.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.31.0/caesura-0.31.0-aarch64-apple-darwin.tar.xz"
      sha256 "ebdc4c8b63732e6918387a5df5f40812e66b8de0bbe0f5f7cc6869742540036c"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.31.0/caesura-0.31.0-x86_64-apple-darwin.tar.xz"
      sha256 "7acb86a6e3ffa6b51eb7705b3f3fc9732285df6c36c4d7b5996ce3c9e9461407"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.31.0/caesura-0.31.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "69220d787805b4215fee297a9cdc4fcc25654f1d23522677f7638deb2c93bb44"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.31.0/caesura-0.31.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bdda95c2553ccf5f45d9e756387289adb69395e418ebc78535fc34d6d738b8ee"
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
