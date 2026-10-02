class HerdrWorld < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0/herdr-world-v0.2.0-darwin-arm64.tar.xz"
      sha256 "6ca92a1231f27f19c71ae76b5366f42eda0d4dea94f8462545d0ab2c85775d61"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0/herdr-world-v0.2.0-darwin-x64.tar.xz"
      sha256 "b4aee38bce1af320066f178a20938bcdad905f8f1f5b89135097cea366d9d08c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0/herdr-world-v0.2.0-linux-arm64.tar.xz"
      sha256 "f4e144400823d4fe75e2352f92f9d7ffc3aebfe2fb2d419ad4c40651f3a701ff"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0/herdr-world-v0.2.0-linux-x64.tar.xz"
      sha256 "53a9f1046822cf035d99b165019eafb5021df0ee49e27d61bdb53e57df4f47ee"
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
    assert_match "herdr-world 0.2.0", shell_output("#{bin}/herdr-world --version")
  end
end
