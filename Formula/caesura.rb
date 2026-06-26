class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "0.30.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.2/caesura-0.30.2-aarch64-apple-darwin.tar.xz"
      sha256 "269fecb7d853eda42f100744f9e724625eaf2f5f421390bb494340b386f6d8bd"
    end
  end
  on_macos do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.2/caesura-0.30.2-x86_64-apple-darwin.tar.xz"
      sha256 "d528cfbdc202c4a2af96abc1f000e1ca141fe1508780a1f81284bc2f2d91fd10"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.2/caesura-0.30.2-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b892d306f93cb7f553f89659637eb5e7b186ad613c4f64478863e2afe754c7b6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RogueOneEcho/caesura/releases/download/v0.30.2/caesura-0.30.2-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fef292c0bee17f98bf1cceaf4763b77116e46eff24b5694762d46aa632d63a86"
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
