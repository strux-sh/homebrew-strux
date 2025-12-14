class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.2/strux-0.0.2-darwin-arm64.tar.gz"
      sha256 "ee557f56b6f5cb5b58b97f435229a99c411fdf81d851463767588efcab177d07"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.2/strux-0.0.2-darwin-x64.tar.gz"
      sha256 "5a497ddd2f5a02ffeb75549c5b5860ebf1558ffb274a85f5231053aaa56972cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.2/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.2/strux-linux-x64"
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
