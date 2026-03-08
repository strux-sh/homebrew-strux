class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.0/strux-0.1.0-darwin-arm64.tar.gz"
      sha256 "d5770893e0201a45f137708f616b1710cc5cc8c42d17a63fd35e4c0fe0a07190"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.0/strux-0.1.0-darwin-x64.tar.gz"
      sha256 "5e83964bb7ae3fb793055508bce1aa2df050ea2019cff7b43e7487adb583bc6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.0/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.0/strux-linux-x64"
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
