cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "ba8a71e177f2b97c16878ac4fa83e62c376ed34eee896418256601f26024525a",
         intel: "59ed9d73eda6b9368c1b336d2df74bef6daaafe8380ac42f2a9f2dfb37ca1027"

  url "https://github.com/semenov/homebase/releases/download/v#{version}/homebase_darwin_#{arch}.tar.gz"
  name "homebase"
  desc "Run local dev servers as launchd agents, reachable at <name>.localhost"
  homepage "https://github.com/semenov/homebase"

  binary "homebase"

  # the binary is not notarized; allow it to run without a Gatekeeper prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/homebase"], must_succeed: false
  end
end
