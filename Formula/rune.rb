class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.3.1/rune-darwin-arm64"
      sha256 "2bdcfd3593a185879890822f10dce2bac1c3b9fa646db44aad6282ef92a65526"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.3.1/rune-darwin-amd64"
      sha256 "91ac4b4f46041a4f6805f3ad861160bb538c208435a1104501ff769fcee399ef"
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
