class Ship < Formula
  desc "Deploy web apps to your own server with one command"
  homepage "https://github.com/semenov/ship"
  version "0.1.0"
  license "MIT"

  base = "https://github.com/semenov/ship/releases/download/v#{version}"
  on_macos do
    on_arm do
      url "#{base}/ship_#{version}_darwin_arm64.tar.gz"
      sha256 "8aae915b898197afa352a64baa8f1ba166bee2aeaa6a47a96e3be782e4407628"
    end
    on_intel do
      url "#{base}/ship_#{version}_darwin_amd64.tar.gz"
      sha256 "12e023986c4fdded7badf3a6ef8dd3e967723ae33830ac46aff1d19bf9162bd5"
    end
  end
  on_linux do
    on_arm do
      url "#{base}/ship_#{version}_linux_arm64.tar.gz"
      sha256 "6bda40dd7b113c0eccd6350daeb8aa7af9a19a562e60c03b03469d9f152f921e"
    end
    on_intel do
      url "#{base}/ship_#{version}_linux_amd64.tar.gz"
      sha256 "0d758e50e3059bdd78dc3094fdc12461c07307c7de4bf4d330c6cc56a543028d"
    end
  end

  def install
    bin.install "ship"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ship --version")
    assert_match "no server configured", shell_output("#{bin}/ship status 2>&1", 3)
  end
end
