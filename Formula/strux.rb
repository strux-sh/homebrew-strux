class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.3.0/strux-0.3.0-darwin-arm64.tar.gz"
      sha256 "ee7692dfc709f84f5b2c2362e8da83f6bded464826021e006e1b725ea059cfeb"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.3.0/strux-0.3.0-darwin-x64.tar.gz"
      sha256 "1f981aab30cb816abcfc59b8d44c4499d55bd296f27d761a5234075c23421ede"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.3.0/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.3.0/strux-linux-x64"
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
