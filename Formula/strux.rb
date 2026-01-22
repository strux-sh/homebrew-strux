class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.15/strux-0.0.15-darwin-arm64.tar.gz"
      sha256 "32dae4daf62c43f73b3edb381582e9046afa7d8d4297b1182e723c15dbe6c294"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.15/strux-0.0.15-darwin-x64.tar.gz"
      sha256 "6bb8a8cecf597c600b558b776364e1bf1a128bc720e1a25d7b4723e9e4a42f93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.0.15/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.0.15/strux-linux-x64"
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
