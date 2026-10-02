class HerdrWorldRc < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.0-rc.3"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.3/herdr-world-v0.2.0-rc.3-darwin-arm64.tar.xz"
      sha256 "12a1c43cf003e86c94f206095bb1709730ea6cd1788b98c5cbd6652fd53fb50b"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.3/herdr-world-v0.2.0-rc.3-darwin-x64.tar.xz"
      sha256 "67327d43f82b5a7b06f0e915a3714074f178c930becb4be9fa10f5fc974e340b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.3/herdr-world-v0.2.0-rc.3-linux-arm64.tar.xz"
      sha256 "0aaddd6a79d41988acc8da9438f7f81a60085560d5c8f40c09df754ff6b9098c"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.3/herdr-world-v0.2.0-rc.3-linux-x64.tar.xz"
      sha256 "2869c96c68b904f413bc672f816808065b06fdfe50e148505fc2325127ad1bd1"
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
    assert_match "herdr-world 0.2.0-rc.3", shell_output("#{bin}/herdr-world --version")
  end
end
