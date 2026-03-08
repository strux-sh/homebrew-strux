class Strux < Formula
  desc "A framework for building kiosk-style operating systems"
  homepage "https://github.com/strux-dev/strux"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.1/strux-0.1.1-darwin-arm64.tar.gz"
      sha256 "21e2af4102b66d9546eb4986475ef23335d08af4337c8991ac20065db6a1cd5f"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.1/strux-0.1.1-darwin-x64.tar.gz"
      sha256 "19793ee4f0840c0e9096de52b612be2390506dd3fac7f50cbc0cf942ba3ca90c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/strux-dev/strux/releases/download/v0.1.1/strux-linux-arm64"
    else
      url "https://github.com/strux-dev/strux/releases/download/v0.1.1/strux-linux-x64"
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
