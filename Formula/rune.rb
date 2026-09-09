class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.1.0/rune-darwin-arm64"
      sha256 "dd75b5a120800d6cbbf1c82fb0e23adb4836c07f5695d5462b7e0bda324fc032"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.1.0/rune-darwin-amd64"
      sha256 "4dc706d97c7aa72546b7348708048e49817b2f9e00a0843a1a2d520fda0c1f94"
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
