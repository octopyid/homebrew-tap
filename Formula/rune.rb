class Rune < Formula
  desc "Project-local task runner that turns Runefiles into CLI commands"
  homepage "https://github.com/octopyid/rune"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/octopyid/rune/releases/download/v1.4.0/rune-darwin-arm64"
      sha256 "88e8da8c89a3f35d94dad8cc63b0e374853de8cacafd44cc95e5b8cb6b558a78"
    end
    on_intel do
      url "https://github.com/octopyid/rune/releases/download/v1.4.0/rune-darwin-amd64"
      sha256 "0d8fc55368d8477251b9a4e5dbaaa62aa330a08a2ef7709ddb592f287b6489f8"
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
