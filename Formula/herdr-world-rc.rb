class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.11/herdr-world-v0.1.0-rc.11-macos-arm64.tar.gz"
      sha256 "43d2d9c284e0dabd5d87dab19492882a82cab5ecd15e67bc87e0c247c810bac9"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.11/herdr-world-v0.1.0-rc.11-macos-x86_64.tar.gz"
      sha256 "55534e3b72cb68e59a4ac1dc2d115dc7dd12658d404652cacafbec721273b4af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.11/herdr-world-v0.1.0-rc.11-linux-x86_64.tar.gz"
      sha256 "aa0508924985b2ca8b3441b460138f2de55de6fc4605a2c206072c02229f34d8"
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
