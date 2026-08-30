class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.14/herdr-world-v0.1.0-rc.14-macos-arm64.tar.gz"
      sha256 "a38fb5c1ec461b4760345665508fcd235584180cbe5c625b27797b663466fa02"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.14/herdr-world-v0.1.0-rc.14-macos-x86_64.tar.gz"
      sha256 "e94e81b5ab3f004f36754a9bf562d48472553ebe05deb9aaff7934fa3ebc0ade"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.14/herdr-world-v0.1.0-rc.14-linux-x86_64.tar.gz"
      sha256 "723af5b37d1fc0e16822f1798bd3fec671bdbd3e4e3b1beef13ec58b911b872f"
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
