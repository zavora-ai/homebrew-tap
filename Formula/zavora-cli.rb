class ZavoraCli < Formula
  desc "ADK-Rust agent platform for terminal work"
  homepage "https://github.com/zavora-ai/zavora-cli"
  url "https://github.com/zavora-ai/zavora-cli.git",
      tag:      "v2.1.0",
      revision: "96e717cc8faf51f8aa6eb47eeff7c613721f3307"
  license "MIT"
  head "https://github.com/zavora-ai/zavora-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zavora-cli --version")
  end
end
