cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  sha256 arm:   "feabb61aeb11c515773cbdd0877952f26807db675ec5d2b760342cdc3ec21184",
         intel: "800c422c75235942511b193c7754755a7a3e91f48ce5e9869a1bca531652036c"

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
