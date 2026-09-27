cask "ship" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  sha256 arm:   "8aae915b898197afa352a64baa8f1ba166bee2aeaa6a47a96e3be782e4407628",
         intel: "12e023986c4fdded7badf3a6ef8dd3e967723ae33830ac46aff1d19bf9162bd5"

  url "https://github.com/semenov/ship/releases/download/v#{version}/ship_#{version}_darwin_#{arch}.tar.gz"
  name "ship"
  desc "Deploy web apps to your own server with one command"
  homepage "https://github.com/semenov/ship"

  binary "ship"

  # the binary is not notarized; allow it to run without a Gatekeeper prompt
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/ship"]
  end
end
