cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.0"
  sha256 arm:   "dea1064acb6d905069409ff40ba741ddd9eb008bbac2d3ef8a6798687e4e3433",
         intel: "9d78bd845e7d54d62da4626e1382aaec9fdc6e0da5b62faf7a4be817ae18a8ce"

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
