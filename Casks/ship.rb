cask "ship" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1"
  sha256 arm:   "49dfcf72e841875558480d4872f3bf42bf68da6d39d617f3991535bf283f8f05",
         intel: "42fc0c7c3d78c67aa66669ef45d418c4ba1ddfaf6e7c23a32df776d42717acc7"

  url "https://github.com/semenov/ship/releases/download/v#{version}/ship_darwin_#{arch}.tar.gz"
  name "ship"
  desc "Deploy web apps to your own server with one command"
  homepage "https://github.com/semenov/ship"

  binary "ship"

  # the binary is not notarized; allow it to run without a Gatekeeper prompt
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/ship"]
  end
end
