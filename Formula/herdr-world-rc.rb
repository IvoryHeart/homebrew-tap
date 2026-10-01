class HerdrWorldRc < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://ivoryheart.github.io/herdr-world/"
  version "0.2.0-rc.1"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.1/herdr-world-v0.2.0-rc.1-darwin-arm64.tar.xz"
      sha256 "04c470dc9c964b3c9520ecb1f151098e6c86e0d945bd9225cd688b0fb0021a02"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.1/herdr-world-v0.2.0-rc.1-darwin-x64.tar.xz"
      sha256 "5f061b77fa2f3e106f3b8288c92253bd2b6b824bbf31248b1c78a3c60a2299e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.1/herdr-world-v0.2.0-rc.1-linux-arm64.tar.xz"
      sha256 "0e232c6f9474d832c71a8de7da644d87a4e5cd211c8b791b0f55ec20dc03f83a"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.0-rc.1/herdr-world-v0.2.0-rc.1-linux-x64.tar.xz"
      sha256 "5d2d710c70307d7f3119eaa66b216140f52dc92d283bbdbba4abef655bdd32a9"
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
    assert_match "herdr-world 0.2.0-rc.1", shell_output("#{bin}/herdr-world --version")
  end
end
