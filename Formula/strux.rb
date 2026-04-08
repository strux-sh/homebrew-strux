class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.2.2/strux-0.2.2-darwin-arm64.tar.gz"
      sha256 "786515026865002799fc7358097c9749ab2d3d6c2ac7ee1a54c5724a60bf41c6"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.2.2/strux-0.2.2-darwin-x64.tar.gz"
      sha256 "8cb2598ad6a58898eb548d0653e5f269c72b9ac6dd73ea66f59c7f577a3d41cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.2.2/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.2.2/strux-linux-x64"
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
