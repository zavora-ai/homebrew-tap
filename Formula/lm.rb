class Lm < Formula
  desc "macOS launchd service manager - CLI interface"
  homepage "https://github.com/zavora-ai/macos-launch-manager"
  url "https://github.com/zavora-ai/macos-launch-manager/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d44d0d7d127d19eda44d0e2c9b0155d2eea5cf3e46890d428004abfe92ba70b1"
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
