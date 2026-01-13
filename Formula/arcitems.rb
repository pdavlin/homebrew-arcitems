class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.13.0015"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0015/arcitems-darwin-arm64.tar.gz"
      sha256 "4fa22e5f7f1addae139eb55fbdaa1565451f3f229f81a12e0900c3b184a9fb7b"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0015/arcitems-darwin-amd64.tar.gz"
      sha256 "5056e107f0d75668a4916ae0b84a371cc5e1496db62ece3fbe78952e1500484b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0015/arcitems-linux-arm64.tar.gz"
      sha256 "63d6b3ba019256306c40e2505b894cb7a0066fa3428e49b7316fad7c161010c8"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.13.0015/arcitems-linux-amd64.tar.gz"
      sha256 "1a0cfd746c57e1f54931eeb75b5db8cb33c3c685454691b95d233121ecca2af4"
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
