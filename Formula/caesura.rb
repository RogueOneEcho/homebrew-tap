class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.27.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-aarch64-apple-darwin.tar.xz"
      sha256 "b378e074f82885735bce5cb67b66b2df909af6f0523f878a91493123ad5df50c"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-x86_64-apple-darwin.tar.xz"
      sha256 "05dbb8de523ec8920f21b2062418fa33e5be7441b6ded4f085d97ee33cee9611"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1d33e2281d277ec80c2ef63c9931a90d15a5c990c52120e54a67a121e901fb3c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.27.0/caesura-0.27.0-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "31ef6d1757efc0f7a51b75d48cddd9100f95b2306168cbd504254eae465e3912"
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
