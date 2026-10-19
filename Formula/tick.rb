class Tick < Formula
  desc "Fast, comprehensive CLI and MCP server for Atlassian (Jira and Confluence)"
  homepage "https://github.com/abhiudayg/tick"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/abhiudayg/tick/releases/download/v2.0.0/tick-aarch64-apple-darwin"
      sha256 "0cd2bb7506e49ba0d9ed15715ffeb7bb5696a068b3d15f8175c3a7e0beb875ad"
    else
      url "https://github.com/abhiudayg/tick/releases/download/v2.0.0/tick-x86_64-apple-darwin"
      sha256 "a582958ec0c1a12d49c8835b952e7931561af96b0cda559defbb337e86141619"
    end
  end

  on_linux do
    url "https://github.com/abhiudayg/tick/releases/download/v2.0.0/tick-x86_64-unknown-linux-gnu"
    sha256 "031485e4d08427c6b61e55f397f66778541b5163d9a5fb7bb1001ee0750040fc"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "tick-aarch64-apple-darwin" => "tick"
    elsif OS.mac?
      bin.install "tick-x86_64-apple-darwin" => "tick"
    else
      bin.install "tick-x86_64-unknown-linux-gnu" => "tick"
    end
  end

  test do
    assert_match "tick", shell_output("#{bin}/tick --help", 0)
  end
end
