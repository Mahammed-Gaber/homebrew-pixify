class PixifyFree < Formula
  desc "High-performance image optimizer and converter (Free Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz"
      sha256 "d1670de702779327dd09804acde977959b507955bc8dc6accac98b50f259a36d"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz"
      sha256 "42a053ef8bed218e24e1dfa7b0e3a95cee58e9e57c3ef98c79058798f35d2e9b"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz"
    sha256 "3c144856735e347788c9c82390f1ba53f4a84edb03ec5ba8fca7ae807b7b59a3"
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

