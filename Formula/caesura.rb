class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.29.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.29.0/caesura-0.29.0-aarch64-apple-darwin.tar.xz"
      sha256 "1592e110100d4eef5ea6892f8303af8d5af7eee93f80d7b33fb0060372290fa2"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.29.0/caesura-0.29.0-x86_64-apple-darwin.tar.xz"
      sha256 "a8fb2999a60ff7f6ae4da186082462a08bb2fac347d2d82f9cfb12c94d97f50e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.29.0/caesura-0.29.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c9818f28ac7f36242b1ec197a7053f488c28af9268c87097f3d8b8623253b83c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.29.0/caesura-0.29.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "76cdf2527190b94e50413e5df59a43acaf7ca13c3517cba94dc260a84bc8310b"
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
