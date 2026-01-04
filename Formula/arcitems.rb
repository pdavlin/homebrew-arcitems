class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.04.0020"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.0020/arcitems-darwin-arm64.tar.gz"
      sha256 "04fd645983e1c59a882567c93046ec49ad72df2a8ba4fdae9c8832d5312c1bc1"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.0020/arcitems-darwin-amd64.tar.gz"
      sha256 "a00395751ed9b1d233c30bf0c28211ece98b1e5767fb883a65d8e52c8b2cb95b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.0020/arcitems-linux-arm64.tar.gz"
      sha256 "ce923ced1ea69d3c8070db7ede398a77ee0303a6b13626a7403cf34b9b9875a7"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.0020/arcitems-linux-amd64.tar.gz"
      sha256 "8ceaf984586c360879e22f6ce6d251cd3a680b7a1d112ae6d0c4a042e58823d1"
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
