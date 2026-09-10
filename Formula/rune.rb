class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.3.2/rune-darwin-arm64"
      sha256 "5f2356f0d95233d755899618a5cb70960aa28791a5373ee5b95af87a39db10dd"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.3.2/rune-darwin-amd64"
      sha256 "ff6499de875a27ace1d7f9fe4fc26fef0d3c218d16aecc74bb50693112c5baac"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "rune-darwin-arm64" => "rune"
    else
      bin.install "rune-darwin-amd64" => "rune"
    end
  end

  test do
    assert_match "rune", shell_output("#{bin}/rune --version")
  end
end
