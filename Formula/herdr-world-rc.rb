class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.8/herdr-world-v0.1.0-rc.8-macos-arm64.tar.gz"
      sha256 "0f5b6769d60abd679b949db66398add57d9892941826eaf54db9efe9e3e49000"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.8/herdr-world-v0.1.0-rc.8-macos-x86_64.tar.gz"
      sha256 "b2a133e1a39cecdb5365e96e100e12de1cba9ad95f85e34c39a534934abec33a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.8/herdr-world-v0.1.0-rc.8-linux-x86_64.tar.gz"
      sha256 "93eddcd0edebbcb96bf6159b63c82c78e32b86830b223d58e999ea3d120eb009"
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
