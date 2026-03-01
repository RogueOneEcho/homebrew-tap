class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.27.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.1/caesura-0.27.1-aarch64-apple-darwin.tar.xz"
      sha256 "6c2a2bf5d1d07f7a4191781d3cf1a823c124937e158db77dcac19025a14c716d"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.1/caesura-0.27.1-x86_64-apple-darwin.tar.xz"
      sha256 "c4627f8fd6539d1664d581cb10c216bc743f976151da88dcd6de8118fbdff504"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.1/caesura-0.27.1-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f664c51ec6333e5f593864137a14dc1968d74ae8e96f26d335a1f54fcbaccf9a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.1/caesura-0.27.1-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "206a91bbf8b6d0875e466070d498f7e368de2b4b4e2f69a70a5dd12730d34f73"
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
