class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.23.2010"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2010/arcitems-darwin-arm64.tar.gz"
      sha256 "680eb19bc2024af45c2f1753512c43def5c305d9803755c7a5464fde69b04217"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2010/arcitems-darwin-amd64.tar.gz"
      sha256 "f6cf5973a747684ca2abb13f2ffac275956f7644a7c85476633432d3857267a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2010/arcitems-linux-arm64.tar.gz"
      sha256 "8f9090ce9dc8ba9b22ec5289a9785fea492cc83c3ee2bcf9390b8db897fdf64b"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2010/arcitems-linux-amd64.tar.gz"
      sha256 "4e15e50b1f12837ad03c0de3b9ce74443b930f73adc7f14713b915e87434ed32"
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
