class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.04.1806"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.1806/arcitems-darwin-arm64.tar.gz"
      sha256 "22cdcdf7eee01a9ebd44779838f554ce82d8e4d799a207d90bc021c5eb9cdb8d"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.1806/arcitems-darwin-amd64.tar.gz"
      sha256 "d251b342e9483cd57c5bdd7512402cf0a35ecc97f325c477218e3682ac6ba905"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.1806/arcitems-linux-arm64.tar.gz"
      sha256 "191f9726c622129368d7ccc51cbe780d9133e7cbc6dd69ad4dcca28b4ee88a0b"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.04.1806/arcitems-linux-amd64.tar.gz"
      sha256 "37bdd2fcbd1b8e8aff0d833da8e26220c0bd2ad68229aa6def1e46db4603669f"
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
