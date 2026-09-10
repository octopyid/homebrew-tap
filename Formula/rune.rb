class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.5.0/rune-darwin-arm64"
      sha256 "ed5ca070868ba336675f1ecedb65fc5d4563df523be90e2be5171ceec44cb3a5"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.5.0/rune-darwin-amd64"
      sha256 "8d749ba42b22003974188831722a04dc107f56c79fb9d5b32d1523e4237f70bb"
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
