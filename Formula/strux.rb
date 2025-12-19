class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.4/strux-0.0.4-darwin-arm64.tar.gz"
      sha256 "f2dc1958e4660f3c76bab87babe026b423cf33c585ad6e90547664b4278fb2aa"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.4/strux-0.0.4-darwin-x64.tar.gz"
      sha256 "46e350cdc4d37390a865dba55d9171e11d4dd5ba32da741f48239795171fc4ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.4/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.4/strux-linux-x64"
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
