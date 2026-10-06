class HerdrWorld < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.2/herdr-world-v0.2.2-darwin-arm64.tar.xz"
      sha256 "6532914de320affa37e449acf00ae6e0563dcfeb6916d39b9d82381f4365fdec"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.2/herdr-world-v0.2.2-darwin-x64.tar.xz"
      sha256 "6973f33124f1667661bae95ec161059eb2a845ca3dcbada4f1f0a329879e5c8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.2/herdr-world-v0.2.2-linux-arm64.tar.xz"
      sha256 "cab58b42a371aeb1a51cb1941d7567bdb1ad84d62992e85cc801ba439b1553ce"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.2/herdr-world-v0.2.2-linux-x64.tar.xz"
      sha256 "5918adeff2e8fde26ea589906194ad6bbb2a14fd4e4b47415f5fb8d7d1552731"
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
    assert_match "herdr-world 0.2.2", shell_output("#{bin}/herdr-world --version")
  end
end
