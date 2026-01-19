class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-arm64.tar.gz"
      sha256 "1f824424fab456cf5e04e8ef91a4858f2df160a6243d60322ae8066a9965b78a"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-x64.tar.gz"
      sha256 "e2f5b823a0518255b81f9c81fa7c183b8896f15d3a919d90de0041d31ffb9efd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-linux-x64"
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
