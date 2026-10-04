class HerdrWorld < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.1/herdr-world-v0.2.1-darwin-arm64.tar.xz"
      sha256 "325463928e0d5dfcaf096f3a8edcba40f5ca8300d5b60d8c71acef9def51c4a5"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.1/herdr-world-v0.2.1-darwin-x64.tar.xz"
      sha256 "69e22a62d00db41b6d0e85e0732354d021a84c3417481fb00913a87f2ea821c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.1/herdr-world-v0.2.1-linux-arm64.tar.xz"
      sha256 "abd26c49029f14863724100dbea648455c85745ad18e38a56df5253b6564a759"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.1/herdr-world-v0.2.1-linux-x64.tar.xz"
      sha256 "5c3bafdc66958edff9ccd0e649f27dcbd69767821186af4c03265157b2e5a45b"
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
    assert_match "herdr-world 0.2.1", shell_output("#{bin}/herdr-world --version")
  end
end
