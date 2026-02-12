class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.26.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.26.0/caesura-0.26.0-aarch64-apple-darwin"
      sha256 "52a266dd87bc9f78e13658f7b8eaa730bc3b0b94cb84cf7e9c2cbb12abce214b"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.26.0/caesura-0.26.0-x86_64-apple-darwin"
      sha256 "902237414c7b8fb938cdb5f21c16a9fbed180a0ccf7a40f02ef8a8869cac877a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.26.0/caesura-0.26.0-x86_64-unknown-linux-gnu"
      sha256 "aa31fcdb54404e04ed0a5d346973c9fbbd0b3952c30324906418876ec1196961"
    end
  end

  depends_on "flac"
  depends_on "lame"
  depends_on "sox"

  def install
    bin.install "caesura"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/caesura --version")
  end
end
