class HerdrWorld < Formula
  desc "Visualize and control your agents in Office and Graph across multiple hosts"
  homepage "https://herdr.world/"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.5/herdr-world-v0.2.5-darwin-arm64.tar.xz"
      sha256 "e07394c936e2999eedc9eca7588f32c3ee20342be23773f8e3b6706c2d481376"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.5/herdr-world-v0.2.5-darwin-x64.tar.xz"
      sha256 "b19d26736a1e34713209f77c36e76d9d27071009b3242e869788ded9098d8d99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.5/herdr-world-v0.2.5-linux-arm64.tar.xz"
      sha256 "263572a09d627f2a861968897f122611902905103c404b3a50998821941824cf"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.5/herdr-world-v0.2.5-linux-x64.tar.xz"
      sha256 "6e1f51cbc792fdf4a58e5959868f02a6fed065284c34d0b1de97af47d2af03d9"
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
    assert_match "herdr-world 0.2.5", shell_output("#{bin}/herdr-world --version")
  end
end
