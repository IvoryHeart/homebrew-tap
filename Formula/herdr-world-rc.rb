class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.10/herdr-world-v0.1.0-rc.10-macos-arm64.tar.gz"
      sha256 "0f88ccd3300c8331a06a685d5e9d8d11cd3986b5612f6f0e0d298b68b1981235"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.10/herdr-world-v0.1.0-rc.10-macos-x86_64.tar.gz"
      sha256 "b256c78eac5c3cbe3ebc946501c63903e75866479eb0a0b2c8859810dae553c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.10/herdr-world-v0.1.0-rc.10-linux-x86_64.tar.gz"
      sha256 "c995e24ae4638bc61aca53956863fd532eeb35cdb4dc0c69debe4ba548b57d21"
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
