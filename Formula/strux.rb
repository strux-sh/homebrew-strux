class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.5/strux-0.0.5-darwin-arm64.tar.gz"
      sha256 "d119fc4844b0c85d9bd95645c325e57089c00822692520db65ffa49bbbdeac6a"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.5/strux-0.0.5-darwin-x64.tar.gz"
      sha256 "9bba7d4dc1d1af71ef773ea36c7af0a67e5d5c1b445f67c812f9a8f4762db3ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.5/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.5/strux-linux-x64"
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
