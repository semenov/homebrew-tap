cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.1"
  sha256 arm:   "510bf1ff4a3a3490518473f2196bc73794d22384706a08eaa0f9f0242ab5af5b",
         intel: "cac2e32d50531436c5f0fa0d90e9cdfc705e9431a36a81a8f7589861d05b6352"

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
