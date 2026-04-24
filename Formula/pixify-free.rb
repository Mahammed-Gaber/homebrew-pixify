class PixifyFree < Formula
  desc "High-performance image optimizer and converter (Free Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz"
      sha256 "295ad77486447e214ab1ab80853742d5bea9c95ec3dae02ed6aeebb4a142672e"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz"
      sha256 "fea3dc1018801521499b8e20d28a7a43582d10d44c33c2375d7222f2000b6e38"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz"
    sha256 "3f83f7576b32c3c08df908a0d766feefd13a942f4390f6bf72874f1e47974634"
  end

  license :cannot_represent

  # libvips dependency - optional if system libvips is available
  # Homebrew will install its own copy if not found
  # To use system libvips: set PKG_CONFIG_PATH and ensure vips is in PATH
  # depends_on "vips" => :recommended

  def install
    # Install the binary to Homebrew's bin directory
    bin.install "pixify-free"
  end

  def caveats
    <<~EOS
      🎉 Pixify Free has been installed successfully!

      Quick start:
        pixify-free -i input/ -o output/

      Get help:
        pixify-free --help

      Check version:
        pixify-free --version

      License:
        By installing, you agree to the Pixify EULA:
        https://getpixify.com/eula
    EOS
  end

  test do
    # Test that the binary exists and runs
    assert_match "Pixify", shell_output("#{bin}/pixify-free --version")
  end
end

