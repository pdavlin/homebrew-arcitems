class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.22.1542"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.1542/arcitems-darwin-arm64.tar.gz"
      sha256 "e34aade3d7a94936713d43699c5c886bae50df854305e492965495d07bf6f247"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.1542/arcitems-darwin-amd64.tar.gz"
      sha256 "e65a9936bb75e4d4ed3d958980741ca9752c12bb15442cb1a726951e034817c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.1542/arcitems-linux-arm64.tar.gz"
      sha256 "046f6956a323691fae8472cbcf24c8a98fee7dfc031d99944155e9d29b2025cd"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.1542/arcitems-linux-amd64.tar.gz"
      sha256 "96c1e2ad0b848b8fbe70c5d6cb7af65bea6fc61a3ccf2068d8da887d9f09d7e9"
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
