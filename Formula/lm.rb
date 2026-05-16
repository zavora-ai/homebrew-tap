class Lm < Formula
  desc "macOS launchd service manager - CLI interface"
  homepage "https://github.com/zavora-ai/macos-launch-manager"
  url "https://github.com/zavora-ai/macos-launch-manager/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "18606d6606264c752faa044cefc9f8eb9f966c8118db923e1188f10e8e66b926"
  license "Apache-2.0"
  head "https://github.com/zavora-ai/macos-launch-manager.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    cd "cli" do
      system "swift", "build", "-c", "release", "--disable-sandbox"
      bin.install ".build/release/lm"
    end
  end

  test do
    assert_match "Launch Manager", shell_output("#{bin}/lm --help")
  end
end
