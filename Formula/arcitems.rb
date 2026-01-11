class Arcitems < Formula
  desc "CLI tool for ARC Raiders item and quest lookup"
  homepage "https://github.com/pdavlin/arcitems"
  version "2026.01.11.0020"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.11.0020/arcitems-darwin-arm64.tar.gz"
      sha256 "05f3fb4e156cd48e95c157bc55e108c63c6055f94283f93cdd043fc443c13fd3"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.11.0020/arcitems-darwin-amd64.tar.gz"
      sha256 "d58dbabff9fb62f497723a18895dd6398b1e211c2c6b00b6ca9f09e262b8c8ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.11.0020/arcitems-linux-arm64.tar.gz"
      sha256 "b123407d4794ee9b135690903fa45852404724dcc0a688e38f933da78b314133"
    else
      url "https://github.com/pdavlin/arcitems/releases/download/v2026.01.11.0020/arcitems-linux-amd64.tar.gz"
      sha256 "2a96d68c80c04d8667877693b4fccb843f3d14bf3dea59d8b01091305c95f908"
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
