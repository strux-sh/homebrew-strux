class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-0.0.19-darwin-arm64.tar.gz"
      sha256 "f95ff36e095aa58899122ef7eabc540d1a70626ad2b957e3ef5ac64cad94da58"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-0.0.19-darwin-x64.tar.gz"
      sha256 "06eb60d438fdc502a553d9a0e323b0d509cc6192ebf2f4991e527842830b17ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.19/strux-linux-x64"
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
