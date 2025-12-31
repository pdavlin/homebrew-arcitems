class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.31.1806"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.31.1806/arcitems-darwin-arm64.tar.gz"
      sha256 "21200e03cb1cbf22598f208599c04415cfad0bcfc8f1de3691385e9e1c7d9b66"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.31.1806/arcitems-darwin-amd64.tar.gz"
      sha256 "a39b57e7b6da84d769b218744bc84401aa5b2f720970b11a6c526f7c2f188a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.31.1806/arcitems-linux-arm64.tar.gz"
      sha256 "5363df95d7797cd510d6f12148361852084b05ef0a28c3f3587fc93b9306ca04"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.31.1806/arcitems-linux-amd64.tar.gz"
      sha256 "8bac83d484260a6b40da63f694759f5e79ff946a4f52e5ddabf29ff9db8a7ab2"
    end
  end

  def install
    bin.install "arcitems-darwin-arm64" => "arcitems" if OS.mac? && Hardware::CPU.arm?
    bin.install "arcitems-darwin-amd64" => "arcitems" if OS.mac? && Hardware::CPU.intel?
    bin.install "arcitems-linux-arm64" => "arcitems" if OS.linux? && Hardware::CPU.arm?
    bin.install "arcitems-linux-amd64" => "arcitems" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arcitems --version")
  end
end
