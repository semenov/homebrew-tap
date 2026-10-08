cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.0"
  sha256 arm:   "d25be97044a4121f03a01214d7e885b8512235da4d47557008c76b14e96475d8",
         intel: "be2a44c97dc2423d273119e8e3d3d5b76fb76952610d2e64c652dee970d8b33b"

  url "https://github.com/semenov/homebase/releases/download/v#{version}/homebase_darwin_#{arch}.tar.gz"
  name "homebase"
  desc "Dev servers on your Mac and deploys to your own server, with real URLs"
  homepage "https://github.com/semenov/homebase"

  binary "homebase"

  # the binary is not notarized; allow it to run without a Gatekeeper prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/homebase"], must_succeed: false
  end
end
