cask "ship" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "dd102a841728c81ec8fad85285dbd4e650d7d23c44565bc775dcfe1041250ca6",
         intel: "27a075b0de9f2451f0b7a680109742a1d69005ac711c71d371b93e468a6cb52e"

  url "https://github.com/semenov/ship/releases/download/v#{version}/ship_darwin_#{arch}.tar.gz"
  name "ship"
  desc "Deploy web apps to your own server with one command"
  homepage "https://github.com/semenov/ship"

  binary "ship"

  # the binary is not notarized; allow it to run without a Gatekeeper prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/ship"], must_succeed: false
  end
end
