class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "ef584a507ac216a07cb1a748645f31ef32a8db11f1f4dd1b01ce57b6f8ff6262"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "3752dd956488b3c924f74d771e448ce216b863a2e8f6b33eb7111114f98eb9f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "0a70ad92fe8c16b518efa93e1ccb289ffa1bd69653749ae703bfadbfd6c84aef"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "59b65dd59290e26cdd7b6525b9ac52558371d669a1216e0c6942519ca68c3b8c"
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
