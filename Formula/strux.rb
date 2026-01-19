class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.8/strux-0.0.8-darwin-arm64.tar.gz"
      sha256 "cf2df0f4db2792db49daa4c9abbc559bd21b3d777cedf7af0e4899a718c0b0dd"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.8/strux-0.0.8-darwin-x64.tar.gz"
      sha256 "67eb781b2d8ab23ab05b5185cbd408fb3a5a76772b1dcbb57416564b76d5d2b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.8/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.8/strux-linux-x64"
    end
  end

  def install
    if OS.mac?
      bin.install "strux"
      bin.install "strux-introspect"
    else
      bin.install Dir["strux*"].first => "strux"
    end
  end

  test do
    system "#{bin}/strux", "--version"
  end
end
