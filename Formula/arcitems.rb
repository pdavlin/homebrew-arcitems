class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.28.1807"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.28.1807/arcitems-darwin-arm64.tar.gz"
      sha256 "8da977ab51b42cfc4111a0fbcc3a069c08f5bd18f9a7079577c38c90c4dd6d85"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.28.1807/arcitems-darwin-amd64.tar.gz"
      sha256 "826bb819da9f7ef60dd7372691491cf2aa6fe0f49f3799bb21169cc900126a90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.28.1807/arcitems-linux-arm64.tar.gz"
      sha256 "00b76c689df70fa3794c96955fef7d2f42d1bb5f5161032e9dd7e9b6e99ef92a"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.28.1807/arcitems-linux-amd64.tar.gz"
      sha256 "d5f62eae8f8875ebe0335b5daac2d9f9c20fb19714f555629743c66a5014e257"
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
