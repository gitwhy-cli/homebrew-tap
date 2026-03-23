class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.dev"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "9d3dd7f9bfe2efa628dd68d2a85c8777d74b47b9488b3651453ec1540606bb16"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "2053bc4170929d300d2aee4a353740e733409c1691ea0c39e1d136ee2bbaf719"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "9af059bae5e4d35402190d1b12616822cb4dc0f96aadeaf7078bb7c0418dde2c"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "812432f72aec2cdbc18e8e7a3b8156ef490321ad4e259f0132dada52dabcb895"
    end
  end

  def install
    bin.install "git-why"
  end

  def caveats
    <<~EOS
      To start using GitWhy, run:

        git why setup

      For more info: https://docs.gitwhy.dev
    EOS
  end

  test do
    system "#{bin}/git-why", "--version"
  end
end
