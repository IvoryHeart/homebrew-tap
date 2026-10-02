class HerdrWorldRc < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://ivoryheart.github.io/herdr-world/"
  version "0.2.0-rc.2"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.2/herdr-world-v0.2.0-rc.2-darwin-arm64.tar.xz"
      sha256 "0330b7e2ab9d31ceca999741490703f53546c3b5cc67cedb87457b6ff05878a9"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.2/herdr-world-v0.2.0-rc.2-darwin-x64.tar.xz"
      sha256 "41a5af5b28350cfac96930c3e0b8e506502b138b796abf0c7ed3796f4f64a879"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.2/herdr-world-v0.2.0-rc.2-linux-arm64.tar.xz"
      sha256 "f9abcc93d07088153b3860d0c73b528521cb708ea1cbbb961ccbb9eea3c4d7b3"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.2/herdr-world-v0.2.0-rc.2-linux-x64.tar.xz"
      sha256 "b5585fce2a5ba04f45d08919cd977a733c2efa3d71ea3aacadf3b227034fbc32"
    end
  end

  conflicts_with "herdr-world", because: "both Formulae provide the herdr-world command"

  def install
    libexec.install "herdr-world", "VERSION",
      "LICENSE", "THIRD_PARTY_NOTICES.md",
      "DEPENDENCY_NOTICES.md", "DEPENDENCY_LICENSES.md",
      "UPSTREAM.md", "LICENSES"
    bin.install_symlink libexec/"herdr-world"
  end

  test do
    assert_match "herdr-world 0.2.0-rc.2", shell_output("#{bin}/herdr-world --version")
  end
end
