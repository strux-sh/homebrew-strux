class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-arm64.tar.gz"
      sha256 "064e2016029d1c30fa624dd6daa8e427bf1afefd62a740c7b50d23fc0d8618cc"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.10/strux-0.0.10-darwin-x64.tar.gz"
      sha256 "78ac302f266b0aa52653039653372edcecfabe64dd3b58d6a9e5d8b8091b3c49"
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
