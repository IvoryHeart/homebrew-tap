class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.5/herdr-world-v0.1.0-rc.5-macos-arm64.tar.gz"
      sha256 "a622417120e688f36e2e3a4a608709e36fe6b4797276c8a81bb38b0bb4df2d4f"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.5/herdr-world-v0.1.0-rc.5-macos-x86_64.tar.gz"
      sha256 "00f6a7c4a6e5e3f35d7f0d23283c7fb45310a35515bb4854eb24d323b1ee9e0b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.5/herdr-world-v0.1.0-rc.5-linux-x86_64.tar.gz"
      sha256 "b4ea43ba2aaa2852f6494ec27334a62c53289b28782e3d4cad8342d298003ed1"
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
