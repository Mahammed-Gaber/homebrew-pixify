class PixifyFree < Formula
  desc "High-performance image optimizer and converter (Free Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_HASH_ARM64"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_HASH_AMD64"
    end
  end

  on_linux do
    on_arm do
      # ARM Linux (Raspberry Pi, etc.)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-arm64.tar.gz"
      sha256 "REPLACE_WITH_HASH_LINUX_ARM64"
    end
    
    on_intel do
      # x86_64 Linux
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz"
      sha256 "REPLACE_WITH_HASH_LINUX_AMD64"
    end
  end

  license "MIT"

  # CRITICAL: This installs libvips automatically!
  depends_on "vips"

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

