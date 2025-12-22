class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.22.2202"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.2202/arcitems-darwin-arm64.tar.gz"
      sha256 "64d38c3bd7fa9116c7b61259e111be3dccb19609e6207013a55e33097caa6749"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.2202/arcitems-darwin-amd64.tar.gz"
      sha256 "fdaa50cb2fc1be58fca76332bb74f4d51588e7e8eecf274776eebdf05a8bc41f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.2202/arcitems-linux-arm64.tar.gz"
      sha256 "e64f4d67d2ee3900f67ee0cb9c784ca1d5a7b185f31ed49f6b0004a048457fa3"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.22.2202/arcitems-linux-amd64.tar.gz"
      sha256 "cb5328a61945ddd13c695ba6782e467e2234ed6d4867e8f837bd7b6fae73baf3"
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
