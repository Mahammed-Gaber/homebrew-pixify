class PixifyPro < Formula
  desc "High-performance image optimizer and converter (Pro Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-arm64.tar.gz"
      sha256 "7157d95ec9f94fd3b2bd38322d5f5813fd88b7a3d585c061c36cb96b41980181"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-amd64.tar.gz"
      sha256 "4e13067472a6fbef152657b168e36e3e23d225ad5f1b8b654c3012e1d44e22b4"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-linux-amd64.tar.gz"
    sha256 "93687e1ff80587cf52a6c4890fc838651b4e0df01c973e330de741dae80bc6b6"
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

