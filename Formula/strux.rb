class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.2.0/strux-0.2.0-darwin-arm64.tar.gz"
      sha256 "fa31af7c5ff8f886303c407bba2860e544034bc20ca05d74420a3324d84aaefa"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.2.0/strux-0.2.0-darwin-x64.tar.gz"
      sha256 "53eb71694a1e1dd167200a78378b6d95ca5cea2020d2f34db45ca677e01e6973"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.2.0/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.2.0/strux-linux-x64"
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
