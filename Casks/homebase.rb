cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "136246c0da49250828555539f643bad4317bfd433586e414f81a74dad90afeaf",
         intel: "d6607b3b2eb6e1f4b536e6e952f0496d733bc59a8861476028978377fa6d78e2"

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
