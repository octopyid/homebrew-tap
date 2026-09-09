class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.0.0/rune-darwin-arm64"
      sha256 "85863217f472fd4778f77f34e8f2a4654a039c8eb8302d878f3225f00efd4559"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.0.0/rune-darwin-amd64"
      sha256 "14a0cfb00668689a1d7bbd6e806f996084f9ab5677382ab8a6521e89fe844028"
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
