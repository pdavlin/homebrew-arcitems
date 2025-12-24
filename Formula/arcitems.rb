class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.24.1551"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1551/arcitems-darwin-arm64.tar.gz"
      sha256 "10095b62eca939958f8025c6477611d4f7ff33471f43b8c4da7ef5d985e791a8"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1551/arcitems-darwin-amd64.tar.gz"
      sha256 "79a31edfc5b0b237d9eec961f21d39ec296db31b23ae3a8c1de8b3b424b99ec5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1551/arcitems-linux-arm64.tar.gz"
      sha256 "3061a3f42c069c7272091093ea627d73bdecfff9ed42e0d7430cc1804f9199a6"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1551/arcitems-linux-amd64.tar.gz"
      sha256 "474f137056e2228082027f97432b6130752b07b0f7ae980a62093692ecfbd2ea"
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
