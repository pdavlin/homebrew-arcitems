class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.07.0016"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.07.0016/arcitems-darwin-arm64.tar.gz"
      sha256 "5fdae0f1a1d88f7abf2ad67cdfc11db48f84c1134a49926cf333930f0c3d518c"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.07.0016/arcitems-darwin-amd64.tar.gz"
      sha256 "28b2b2d925fecfea57413e951086ad0bd0ddc9aaf700646b02dfa548267c668c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.07.0016/arcitems-linux-arm64.tar.gz"
      sha256 "e6e3bc1a2d95ecf810605e197e74b2bc2654ca838fa342568efa7f949390de2e"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.07.0016/arcitems-linux-amd64.tar.gz"
      sha256 "2f945079230c943e7af246b2c34b5f5608c6e48fd30d95988b1dab26fd657107"
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
