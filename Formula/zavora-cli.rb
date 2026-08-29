class ZavoraCli < Formula
  desc "ADK-Rust coding agent for the terminal"
  homepage "https://github.com/zavora-ai/zavora-cli"
  # Git tag + revision rather than the auto-generated source tarball, matching
  # zlm.rb in this tap. GitHub's archive/refs/tags/*.tar.gz files are not
  # guaranteed to be byte-stable, which causes intermittent checksum mismatches;
  # a pinned revision is reproducible and needs no sha256 to maintain. It also
  # removes the release-time step that regenerated a digest and pushed it back,
  # which is what left this formula unusable after v2.0.0.
  url "https://github.com/zavora-ai/zavora-cli.git",
      tag:      "v2.0.0",
      revision: "0a9db44becb6425d7ffc64c6b4fd4bc83958fe6a"
  license "MIT"
  head "https://github.com/zavora-ai/zavora-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", *std_cargo_args(path: ".")
  end

  test do
    assert_match "zavora-cli 2.0.0", shell_output("#{bin}/zavora-cli --version")
    assert_match "Usage:", shell_output("#{bin}/zavora-cli --help")
  desc "ADK-Rust agent platform for terminal work"
  homepage "https://github.com/zavora-ai/zavora-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.1/zavora-cli-v2.1.1-darwin-arm64.tar.gz"
      sha256 "6a31a724d24905fce9f936321fdeebb8a56d990bee12362ef31322f6c5804355"
    end

    on_intel do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.1/zavora-cli-v2.1.1-darwin-x64.tar.gz"
      sha256 "19ad4679b6f4ff6f0866dd9ebe741f047291d86577ec29e738f7a4192e88e8e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.1/zavora-cli-v2.1.1-linux-arm64.tar.gz"
      sha256 "807165caff56981ef9f9cfe0d729d3d48dc5a6e3573737b6a3dae7f52412d8ce"
    end

    on_intel do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.1/zavora-cli-v2.1.1-linux-x64.tar.gz"
      sha256 "00b14e1a9872b96e8453d0b9faea14a671c2b346085f8a0e91076bea0bc2e3ff"
    end
  end

  def install
    runtime = libexec/"runtime"
    runtime.install "zavora-cli", "libexec"
    bin.write_exec_script runtime/"zavora-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zavora-cli --version")
  end
end
