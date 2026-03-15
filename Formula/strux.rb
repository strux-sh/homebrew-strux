class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.3/strux-0.1.3-darwin-arm64.tar.gz"
      sha256 "5bae420e99ddb94c858cfb38cd0dde14844e449b539d78ea377b184bdba902b0"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.3/strux-0.1.3-darwin-x64.tar.gz"
      sha256 "f6b5374c4b7c45d45a0889759b7f8c66e76777d97b04ce4ed9d4479edad8d92b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.3/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.3/strux-linux-x64"
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
