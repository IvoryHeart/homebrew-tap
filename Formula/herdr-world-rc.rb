class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.15/herdr-world-v0.1.0-rc.15-macos-arm64.tar.gz"
      sha256 "3084f23c8495ec3cd972e27b1ab01b1b82d9300b7bdb71299c19e5f86d80abe4"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.15/herdr-world-v0.1.0-rc.15-macos-x86_64.tar.gz"
      sha256 "2d5dde44f745aad420f411a10f35d0f70659dafa1eae8c0466b17503c6834a88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.15/herdr-world-v0.1.0-rc.15-linux-x86_64.tar.gz"
      sha256 "daa473433503d5861bbe982cf2afe1fba717599126d1a1a5c1574b3b4c9820ea"
    end
  end

  conflicts_with "herdr-world", because: "both Formulae provide the herdr-world command"

  def install
    libexec.install "VERSION", "bin", "share", "docs", "vendor",
      "third_party", "LICENSE", "THIRD_PARTY_NOTICES.md", "UPSTREAM.md",
      "README.md", "install"
    bin.install_symlink libexec/"bin/herdr-world"
  end

  test do
    system bin/"herdr-world", "--help"
  end
end
