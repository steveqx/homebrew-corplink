class CorplinkRs < Formula
  desc "使用 rust 实现的飞连客户端"
  homepage "https://github.com/PinkD/corplink-rs"
  version "X.Y.Z"
  license "GPL-2.0"

  # 只保留 macOS ARM 架构
  url "https://github.com/PinkD/corplink-rs/releases/download/v#{version}/corplink-rs-v#{version}-macos-arm64.tar.gz"
  sha256 "REPLACE_WITH_ARM64_SHA256"

  def install
    bin.install "corplink-rs"
    (etc/"corplink-rs").mkpath
  end

  service do
    run [opt_bin/"corplink-rs", etc/"corplink-rs/config.json"]
    working_dir etc/"corplink-rs/"
    keep_alive true
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  test do
    assert_match "corplink-rs", shell_output("#{bin}/corplink-rs --version")
  end
end