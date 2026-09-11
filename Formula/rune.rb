class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.6.0/rune-darwin-arm64"
      sha256 "f72074c38b5db214388442b556c4eedef8ff4d8cbdda12c8cd67b4771ce07cb3"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.6.0/rune-darwin-amd64"
      sha256 "857d59145f54a95bf5b2400368d5b1cdd1634cd09a70c8c22c514f36fe7f68c0"
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
