class HerdrWorld < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.1/herdr-world-v0.1.1-macos-arm64.tar.gz"
      sha256 "a57391e3da17b42ed1ead7c38d74b9703aded96e10a6e307b5b28d8a368795ce"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.1/herdr-world-v0.1.1-macos-x86_64.tar.gz"
      sha256 "8ca2b5d75dea5470a4bcedd8b529f51d032619beef9b18d908f68d08bf14607c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.1/herdr-world-v0.1.1-linux-x86_64.tar.gz"
      sha256 "73e864d8540ef7b9d9d7ea4ebacdb00d7f05e2318de210e3d398ba2a33def70c"
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
