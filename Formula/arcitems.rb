class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.10.1807"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.10.1807/arcitems-darwin-arm64.tar.gz"
      sha256 "ee3b7a3ada3eacd86ef61ad7f25d6550086068101c277baf890f0f2331ce969e"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.10.1807/arcitems-darwin-amd64.tar.gz"
      sha256 "7aee1db9a62532af041c49890ea5d84eed931d7adc8c88a2f57ee4cd1b07ccd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.10.1807/arcitems-linux-arm64.tar.gz"
      sha256 "b43c12c38ae163f5aeac1c9e3048bf3460a27af4030f8cc65de44dba705b331f"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.10.1807/arcitems-linux-amd64.tar.gz"
      sha256 "771a0313ae64b22ee394de39b537a5c2e4fceee73eb4dde100c83243a38a990b"
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
