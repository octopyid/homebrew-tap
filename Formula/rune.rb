class Rune < Formula
  desc "Run tasks, not scripts. A project-local task runner that turns your Runefile into a first-class CLI"
  homepage "https://github.com/octopyid/rune"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v0.1.0/rune-darwin-arm64"
      sha256 "753f2a53f00f879a4e2cd8d88f0cd1b8cc83f06e36d9b4361c58aa80deee692f"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v0.1.0/rune-darwin-amd64"
      sha256 "36f113dcd4f66d79b7b5e7a7c17aa34fc8374a8f1354bb011181c971b7f6c937"
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
