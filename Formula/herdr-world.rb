class HerdrWorld < Formula
  desc "Visual IDE for AI agents with office, mindmaps and boards"
  homepage "https://herdr.world/"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.6/herdr-world-v0.2.6-darwin-arm64.tar.xz"
      sha256 "636844a98d19cda9fd9e3b7a952db4c821a5879f727085ec21c2499a1eda4857"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.6/herdr-world-v0.2.6-darwin-x64.tar.xz"
      sha256 "3465cae0fe0fc5b0df8d30fc2910cfda9e7394b6decf5d9de3882b6b3bd35e14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.6/herdr-world-v0.2.6-linux-arm64.tar.xz"
      sha256 "bdd2c6dbb11d923bcb1d93cd98a52de43275c274f33d665fc07fc3f792d447ad"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.6/herdr-world-v0.2.6-linux-x64.tar.xz"
      sha256 "5dd3e3f3ec77a29fcab9dcf0daa02064f89c28884781a6b6e40f9e47b8765fe6"
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
    assert_match "herdr-world 0.2.6", shell_output("#{bin}/herdr-world --version")
  end
end
