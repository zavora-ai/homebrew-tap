class ZavoraCli < Formula
  desc "ADK-Rust agent platform for terminal work"
  homepage "https://github.com/zavora-ai/zavora-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.0/zavora-cli-v2.1.0-darwin-arm64.tar.gz"
      sha256 "c3bf4343abf823b23f3f04a2603adfcf088927fc9528493d151d6305af329d9d"
    end

    on_intel do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.0/zavora-cli-v2.1.0-darwin-x64.tar.gz"
      sha256 "0ac91b7bc70d29a3d13c5778752d9aadb0351f60ec831a124ec49645a60bab4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.0/zavora-cli-v2.1.0-linux-arm64.tar.gz"
      sha256 "4ed3547c688a20d24dea4c0ffedfec0384239df92a0198f9eb1f4dd24be91c08"
    end

    on_intel do
      url "https://github.com/zavora-ai/zavora-cli/releases/download/v2.1.0/zavora-cli-v2.1.0-linux-x64.tar.gz"
      sha256 "1d6f52313eddf6361970b40da49a6b30df5b978bed7bf44168e0caa7a01dd07f"
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
