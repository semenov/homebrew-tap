class Ship < Formula
  desc "Deploy web apps to your own server with one command"
  homepage "https://github.com/semenov/ship"
  url "https://github.com/semenov/ship/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c482fa89b969de4011bcf09404c55e6c76fea004dde65826f8b86e0baa52218c"
  license "MIT"
  head "https://github.com/semenov/ship.git", branch: "main"

  depends_on "go" => :build

  def install
    # builds the linux shipd helpers first, then embeds them into ship
    system "make", "build", "VERSION=#{version}"
    bin.install "dist/ship"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ship --version")
    assert_match "no server configured", shell_output("#{bin}/ship status 2>&1", 3)
  end
end
