cask "ship" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.1"
  sha256 arm:   "1924ee2cf7d47c256af04b329470949b0b20a22b1e25db1d9dba61c35b9d0c83",
         intel: "b743acfdc92cfe76c3d8b9c38eeae535d3e5489a0ab6d0eb78d4f52a46aaf810"

  url "https://github.com/semenov/ship/releases/download/v#{version}/ship_darwin_#{arch}.tar.gz"
  name "ship"
  desc "Deploy web apps to your own server with one command"
  homepage "https://github.com/semenov/ship"

  deprecate! date: "2026-10-08", because: "is now part of homebase (`brew install semenov/tap/homebase`, then `homebase deploy`)"

  binary "ship"

  # the binary is not notarized; allow it to run without a Gatekeeper prompt
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/ship"], must_succeed: false
  end
end
