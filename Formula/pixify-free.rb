class PixifyFree < Formula
  desc "High-performance image optimizer and converter (Free Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz"
      sha256 "c2a3789b33b77a7e50115679d2e5abd4399808ece25cbcee020f77f20e44158c"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz"
      sha256 "9fbd3f3195587cf65916c623f563cd7406dc98e249a6485ff97c8dd93aedf2e4"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz"
    sha256 "0bfcc193a97ed87262927393768887d7d976943e0cb29066556e8f23089e84f0"
  end

  license "EULA"

  # libvips dependency - optional if system libvips is available
  # Homebrew will install its own copy if not found
  # To use system libvips: set PKG_CONFIG_PATH and ensure vips is in PATH
  # depends_on "vips" => :recommended

  def install
    # Install the binary to Homebrew's bin directory
    bin.install "pixify-free"
    # Create symlink for convenience
    bin.install_symlink "pixify-free" => "pixify"
  end

  def caveats
    <<~EOS
      🎉 Pixify Free has been installed successfully!
      
      Quick start:
        pixify-free -i input/ -o output/
        # or use the symlink:
        pixify -i input/ -o output/
      
      Get help:
        pixify-free --help
      
      Check version:
        pixify-free --version
    EOS
  end

  test do
    # Test that the binary exists and runs
    assert_match "Pixify", shell_output("#{bin}/pixify-free --version")
  end
end

