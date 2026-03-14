class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.2/strux-0.1.2-darwin-arm64.tar.gz"
      sha256 "1771ce404c6a8761294be2f9d46c3fcf4aa05c0bef67f381acddbffe89d3ab42"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.2/strux-0.1.2-darwin-x64.tar.gz"
      sha256 "436983672e6d38c83cfb8d3ff05f428352eb84216458923ebc8d43e53f14f3f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.2/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.2/strux-linux-x64"
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
