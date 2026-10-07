cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm:   "d182600093f5a74c3796d12ca5d525177bc992dbf213c9fa6cabe65ad24d2ea4",
         intel: "556d48d9a9db838be2ed65b4be64e41abefb42a09c4f26c9095c81ebb1de6f1b"

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
