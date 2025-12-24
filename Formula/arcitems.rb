class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2025.12.24.1733"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1733/arcitems-darwin-arm64.tar.gz"
      sha256 "b5dda5e97169223900e865787c52dc077df2355d6b5174b64a5712a707f61aa8"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1733/arcitems-darwin-amd64.tar.gz"
      sha256 "bd7a097a5395057ef8ae62a45e491596bc547c9ec24bd7aa5751c9985ea1b180"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1733/arcitems-linux-arm64.tar.gz"
      sha256 "c66e48bc1929e3d4655b81e15566d7dd3b9c6094ecc65660a1a697b8f7998a45"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2025.12.24.1733/arcitems-linux-amd64.tar.gz"
      sha256 "bfc48ac9cb95db36dc51d64e82ffcd90fcb690a6b104e49895ac4c4642d57c4b"
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
