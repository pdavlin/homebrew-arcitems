class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.23.2017"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2017/arcitems-darwin-arm64.tar.gz"
      sha256 "df80380ec20061368513b21041fbfe17e7b60e268bd2515601aa2aad2c96c045"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2017/arcitems-darwin-amd64.tar.gz"
      sha256 "e5ff97d0134c77831a3051de2176522631c4906ce831da5c5c9830150744fe0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2017/arcitems-linux-arm64.tar.gz"
      sha256 "c3e1c5e401125ecccc9af605141469d2952d6bf9287f24925cb0d025bc1c3fd1"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.23.2017/arcitems-linux-amd64.tar.gz"
      sha256 "cb7b1e3d7190d987841b5ab82311005876733ea029e89e71b919a88f0c5a7777"
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
