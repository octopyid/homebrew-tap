class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.4.1/rune-darwin-arm64"
      sha256 "7648e5548a56f7782f1c54510f90d5a24d354a3cbb0d669f824c46536b994726"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.4.1/rune-darwin-amd64"
      sha256 "fb714e1f579e75a59c786347cab3aa529bbec10efb07d069d96128db062dc079"
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
