class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.01.1807"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.01.1807/arcitems-darwin-arm64.tar.gz"
      sha256 "6ba0802437b2cd729799ffdb116a076b031840e3418a6f54f0e5085318eb5046"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.01.1807/arcitems-darwin-amd64.tar.gz"
      sha256 "c6b8c1e3d19abdf11225b502ac07135a5a813958027a345a627bf0585569a217"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.01.1807/arcitems-linux-arm64.tar.gz"
      sha256 "1f18fab662dc44a20c84486bc91865c11ff90e41f025012d4dd767def70ae202"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.01.1807/arcitems-linux-amd64.tar.gz"
      sha256 "b1fbd880ead8338c0780bef824bf7cec7ef6672511566066c5a99121b351e640"
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
