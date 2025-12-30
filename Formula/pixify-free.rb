class PixifyFree < Formula
  desc "High-performance image optimizer and converter (Free Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz"
      sha256 "96166c7f54f05e9d39565b9827707e84f7495cd1f799f3ff4de5740164060d26"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz"
      sha256 "c2a363b79cc5613bb6634fb8aadb6b1ca80204d10a14a8db932faa65079c32e8"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz"
    sha256 "a6cfdceb9aa3b7f1602447f509d118f402366eb7a815f9e3c86f52dbe24fcb2a"
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

