cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.1"
  sha256 arm:   "44f0270437bbbe82085e9fc7b2c751223eff122811edc732508be163784d8cf2",
         intel: "b6e18d2cce411a623bf7c41b45d770a912e5b813f68ca16ea9338c541dfc7856"

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
