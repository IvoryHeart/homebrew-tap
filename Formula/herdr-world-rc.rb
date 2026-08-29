class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.6/herdr-world-v0.1.0-rc.6-macos-arm64.tar.gz"
      sha256 "b840c35f9592dea32dc21d713a19230d088eb37a09c60f1520f67327ac2c9037"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.6/herdr-world-v0.1.0-rc.6-macos-x86_64.tar.gz"
      sha256 "7fbc2614e7105ff6743d467eae390df694aa36da502fbf7036c3fde41f976c5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.6/herdr-world-v0.1.0-rc.6-linux-x86_64.tar.gz"
      sha256 "8e40dd10ada0bf7eb3d2d6db01232406197af3d40d4bbda8ee9807bb740aa2b5"
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
