class PixifyPro < Formula
  desc "High-performance image optimizer and converter (Pro Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-arm64.tar.gz"
      sha256 "c7cd455e2c943e389acaf83ace0218427a7d358cfbe03951a20f226d76b74e30"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-amd64.tar.gz"
      sha256 "2bbb0368c24dd9ea0d80b5d42af25013ca4149a98de3e5833514f44b95140fbf"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-linux-amd64.tar.gz"
    sha256 "6058e409096596b13d1f9d8a3076d7b8cd5a7c919d77f15dc31116a670b697fa"
  end

  license :cannot_represent

  # libvips dependency - optional if system libvips is available
  # Homebrew will install its own copy if not found
  # To use system libvips: set PKG_CONFIG_PATH and ensure vips is in PATH
  # depends_on "vips" => :recommended

  def install
    # Install the binary to Homebrew's bin directory
    bin.install "pixify-pro"
  end

  def caveats
    <<~EOS
      🎉 Pixify Pro has been installed successfully!

      Quick start:
        pixify-pro -i input/ -o output/

      Get help:
        pixify-pro --help

      Check version:
        pixify-pro --version

      ⚠️  A valid Pro license key is required.
      Activate at: https://getpixify.com/pricing

      By installing, you agree to the Pixify EULA:
      https://getpixify.com/eula
    EOS
  end

  test do
    # Test that the binary exists and runs
    assert_match "Pixify", shell_output("#{bin}/pixify-pro --version")
  end
end

