cask "homebase" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "2a7605a823d367bb8d037301d7cbbbf1e80b7a97f18561c5a916735093a1ba58",
         intel: "dd504766cdffd8c3c7d4e8afd634645aa825111a349615b1fae5a425eb07633c"

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
