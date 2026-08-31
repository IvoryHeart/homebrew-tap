class HerdrWorld < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0/herdr-world-v0.1.0-macos-arm64.tar.gz"
      sha256 "ad30da4168c6f10184d6d22cc3fc3b4acca8c4f8e9c228be876545ca08f50e2d"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0/herdr-world-v0.1.0-macos-x86_64.tar.gz"
      sha256 "7c970c715790dae82557defa67f4e0b09aea1bbc50345d5525e2b64801f7cb2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0/herdr-world-v0.1.0-linux-x86_64.tar.gz"
      sha256 "5b127931c4c75fd6f8b4e0a83f85c6996214be77763c8fcbdf8728597b91bc99"
    end
  end

  conflicts_with "herdr-world-rc", because: "both Formulae provide the herdr-world command"

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
