class HerdrWorld < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.3/herdr-world-v0.2.3-darwin-arm64.tar.xz"
      sha256 "715e0116c9833b798c120051b20d66f2d62ff37349057573194ec65184644937"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.3/herdr-world-v0.2.3-darwin-x64.tar.xz"
      sha256 "4e495e538ace097e044953f5b6a972e361e263c2e198af6d8d2487564c85ea78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.3/herdr-world-v0.2.3-linux-arm64.tar.xz"
      sha256 "6a758d594e588650299007f871858ccdc62f65b508b8f1cd8ef4c5c03c01f80d"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.3/herdr-world-v0.2.3-linux-x64.tar.xz"
      sha256 "4d9a5a30fe986e5f00cd0ece96afaf3326e1b291c749def07a092e419ba605fd"
    end
  end

  conflicts_with "herdr-world-rc", because: "both Formulae provide the herdr-world command"

  def install
    libexec.install "herdr-world", "VERSION",
      "LICENSE", "THIRD_PARTY_NOTICES.md",
      "DEPENDENCY_NOTICES.md", "DEPENDENCY_LICENSES.md",
      "UPSTREAM.md", "LICENSES"
    bin.install_symlink libexec/"herdr-world"
  end

  test do
    assert_match "herdr-world 0.2.3", shell_output("#{bin}/herdr-world --version")
  end
end
