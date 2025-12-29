class Pixify < Formula
    desc "High-performance image optimizer and converter"
    homepage "https://github.com/Mahammed-Gaber/Pixify-Pro"
    version "1.0.0"
    
    on_macos do
      on_arm do
        # Apple Silicon (M1/M2/M3)
        url "https://github.com/Mahammed-Gaber/Pixify-Pro/releases/download/v1.0.0/pixify-darwin-arm64.tar.gz"
        sha256 "REPLACE_WITH_HASH_ARM64"
      end
      
      on_intel do
        # Intel Mac
        url "https://github.com/Mahammed-Gaber/Pixify-Pro/releases/download/v1.0.0/pixify-darwin-amd64.tar.gz"
        sha256 "REPLACE_WITH_HASH_AMD64"
      end
    end
  
    on_linux do
      on_arm do
        # ARM Linux (Raspberry Pi, etc.)
        url "https://github.com/Mahammed-Gaber/Pixify-Pro/releases/download/v1.0.0/pixify-linux-arm64.tar.gz"
        sha256 "REPLACE_WITH_HASH_LINUX_ARM64"
      end
      
      on_intel do
        # x86_64 Linux
        url "https://github.com/Mahammed-Gaber/Pixify-Pro/releases/download/v1.0.0/pixify-linux-amd64.tar.gz"
        sha256 "REPLACE_WITH_HASH_LINUX_AMD64"
      end
    end
  
    license "MIT"
  
    # CRITICAL: This installs libvips automatically!
    depends_on "vips"
  
    def install
      # Install the binary to Homebrew's bin directory
      bin.install "pixify"
    end
  
    def caveats
      <<~EOS
        🎉 Pixify has been installed successfully!
        
        Quick start:
          pixify -i input/ -o output/
        
        Get help:
          pixify --help
        
        Check version:
          pixify --version
      EOS
    end
  
    test do
      # Test that the binary exists and runs
      assert_match "Pixify", shell_output("#{bin}/pixify --version")
    end
  end