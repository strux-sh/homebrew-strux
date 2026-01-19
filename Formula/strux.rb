class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.9/strux-0.0.9-darwin-arm64.tar.gz"
      sha256 "7dc4740734707dc351024d4f7e5921887246ffa00c6794c6b3f98e4297893ab5"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.9/strux-0.0.9-darwin-x64.tar.gz"
      sha256 "eeab4fb6f852f5c14f66675a84d39e33c77c98be8100b0dae2a9acc1ca1ab7ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.9/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.9/strux-linux-x64"
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
