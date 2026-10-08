class Hangar < Formula
  desc "Start, stop and open Claude Code Remote Control sessions from your iPhone"
  homepage "https://github.com/semenov/hangar"
  url "https://github.com/semenov/hangar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9e531411362fd4bfa161f6fe45be66d30f44efa9999acfd89e8cd7bd04a31f71"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    cd "backend" do
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}", output: bin/"hangar")
    end
  end

  service do
    run [opt_bin/"hangar", "serve"]
    keep_alive true
    process_type :interactive
    environment_variables PATH: "#{Dir.home}/.local/bin:#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    log_path var/"log/hangar.log"
    error_log_path var/"log/hangar.log"
  end

  def caveats
    <<~EOS
      Set it up and pair the iPhone app:
        hangar setup
    EOS
  end

  test do
    assert_match "hangar #{version}", shell_output("#{bin}/hangar version")
  end
end
