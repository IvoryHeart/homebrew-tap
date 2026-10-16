class HerdrWorld < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.4/herdr-world-v0.2.4-darwin-arm64.tar.xz"
      sha256 "a39bf28f0b05d8535117637cfd784547740b632b944ae6bb12edafad12257bd0"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.4/herdr-world-v0.2.4-darwin-x64.tar.xz"
      sha256 "4b79d83d80a32e54b7d488cedb924a1b3e7277043db0717d89fa27af72d8db4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.4/herdr-world-v0.2.4-linux-arm64.tar.xz"
      sha256 "391ca6df140da1908a3f6ee00ebca120364faaa6d6c9f333a0f0d1514b81811c"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.4/herdr-world-v0.2.4-linux-x64.tar.xz"
      sha256 "963ca4c986d63c77a4e6d4ba3dcda1a9d0f14d9ad61e4dc2fa2d806b485fbdac"
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
    assert_match "herdr-world 0.2.4", shell_output("#{bin}/herdr-world --version")
  end
end
