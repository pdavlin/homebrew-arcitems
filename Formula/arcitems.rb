class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.03.1806"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.03.1806/arcitems-darwin-arm64.tar.gz"
      sha256 "8feb1bb98e722f489cf80ed83bf75294b7bcfac0981d79cc01161a846b5d9a24"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.03.1806/arcitems-darwin-amd64.tar.gz"
      sha256 "116f4df2541180fb8137756cd05631b7f0615882f8e39e3f7506cdfa65b96c7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.03.1806/arcitems-linux-arm64.tar.gz"
      sha256 "30bf9007d2e85371df0da788064b84ebb312e0f8444ba152f839336d14e7cc5b"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.03.1806/arcitems-linux-amd64.tar.gz"
      sha256 "20438b7b0b30569fec60f3f0c6499616883f4f24bf5433697a5b96511ec9125f"
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
