class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.20.0017"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.20.0017/arcitems-darwin-arm64.tar.gz"
      sha256 "1d5116a4b5f9913f1738cde71073253d8fb2e4d3b2b94153390dc7f27e8ff25a"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.20.0017/arcitems-darwin-amd64.tar.gz"
      sha256 "a3bec2148e56b51b3f2a2e7c868677a8082015c12c959f12e4bdd8dc1e11f6bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.20.0017/arcitems-linux-arm64.tar.gz"
      sha256 "ac1f0e291c7bde76499633fbd831cfd8a2b37030263185fd86768b2957ee9a93"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.20.0017/arcitems-linux-amd64.tar.gz"
      sha256 "86fa54b3ec49b9a7f504c26e4d7816beb7de866434aec4d789d397f9ade2cd7a"
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
