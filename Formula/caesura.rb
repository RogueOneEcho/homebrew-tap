class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.33.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.33.1/caesura-0.33.1-aarch64-apple-darwin.tar.xz"
      sha256 "b0d6de5cad55b2faf20e00d4ce4818fa464cb642d55dc924d2eefab2ec5e358e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.33.1/caesura-0.33.1-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9ed8c046f4abff5d2a6f366cc9ec4e8bdae96ad61c2003ed66301fc10c0b348d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.33.1/caesura-0.33.1-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d65d6f33d50ea057a37e8b3134389e5abfb570e0be051f8a53dd940f78459240"
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
