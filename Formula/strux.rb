class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.2.1/strux-0.2.1-darwin-arm64.tar.gz"
      sha256 "abbcd8198c87668921e81e8688a0a3a6f387c0e5a2658bfd0c7cb131eb512e8e"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.2.1/strux-0.2.1-darwin-x64.tar.gz"
      sha256 "b7fe9741a9f0cf4fc7313b0d70c1a0d1d4ee8c317a709a44c2325a3198c62491"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.2.1/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.2.1/strux-linux-x64"
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
