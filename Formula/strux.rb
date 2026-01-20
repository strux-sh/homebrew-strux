class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-arm64.tar.gz"
      sha256 "201e7c84a950bef8a72d99d1ebdddd69e2d5bc423a3d32d8cc4c5f7725491706"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-x64.tar.gz"
      sha256 "ce7c355cdda68ef6c9aad6bdf8cc23f7c77092e8422549c6972f25f16960233c"
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
