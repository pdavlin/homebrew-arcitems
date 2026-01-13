class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.13.0607"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0607/arcitems-darwin-arm64.tar.gz"
      sha256 "29798c7de8323b2ce1604890a22a6d874d3f3474f8e0a2ed51c3b37751a7a9fb"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0607/arcitems-darwin-amd64.tar.gz"
      sha256 "8bd845618dea71c7ae74f0b43786841236d6780de93a48ef52f0533b185cf092"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0607/arcitems-linux-arm64.tar.gz"
      sha256 "a48679963a81f2a8f115649e76574c1e1161c78a962016fa5caa645dce0284c9"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0607/arcitems-linux-amd64.tar.gz"
      sha256 "b2865cb8cfac6e2f6fd439a945c50488561ae7246cf493c3d94ad986c9de4ed5"
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
