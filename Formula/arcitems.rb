class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.24.1522"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1522/arcitems-darwin-arm64.tar.gz"
      sha256 "fada2151d208fa41cb8d113d4a47563abff9d47715fc48b57fbab412ca4464da"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1522/arcitems-darwin-amd64.tar.gz"
      sha256 "45f889b34a23b5fc2869f9630ce4d31428b436c8d175e547cbe94358f8227fd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1522/arcitems-linux-arm64.tar.gz"
      sha256 "56cf341431ebc7ce46481d7f8c3a938f1273340a6c226a0e8409efb0b5d4b7f3"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1522/arcitems-linux-amd64.tar.gz"
      sha256 "f89d9f13d6021abd4e3972886e5fd38f88c9bac2436535c530a12f1e567cc86d"
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
