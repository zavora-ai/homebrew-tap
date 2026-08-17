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
  end
end
