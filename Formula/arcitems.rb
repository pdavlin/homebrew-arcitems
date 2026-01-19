class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.19.1807"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.19.1807/arcitems-darwin-arm64.tar.gz"
      sha256 "5cbd59ce0142b41dd77cfa837ee6dcec7410672eb5e5744ecaa36117d03fe05d"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.19.1807/arcitems-darwin-amd64.tar.gz"
      sha256 "a50655df712a199ce2aa7c5ffa6b19cdefa30f45631ef30374b03455d6ac906a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.19.1807/arcitems-linux-arm64.tar.gz"
      sha256 "5fe292b47f211e5d940502455c8f0133c11699b910ed2724da3fdfd157557d95"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.19.1807/arcitems-linux-amd64.tar.gz"
      sha256 "3d1622bbe4ad8d9f2e14daa3c085207117f534145b169c4777f92407a303a5b8"
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
