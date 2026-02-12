class Caesura < Formula
  desc "CLI for transcoding FLAC audio and uploading to Gazelle-based trackers"
  homepage "https://github.com/RogueOneEcho/caesura"
  version "__VERSION__"
  license "AGPL-3.0-or-later"

__PLATFORM_BLOCKS__

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
