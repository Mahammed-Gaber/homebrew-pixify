class PixifyPro < Formula
  desc "High-performance image optimizer and converter (Pro Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-arm64.tar.gz"
      sha256 "f61aa0384b129fa75c25f9b5aa00c938663332d6eaccb1fa974067f235fbea69"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-amd64.tar.gz"
      sha256 "de40372e8a148eb3ee14e0d028a384cb3a4dfe563de60a5f47a42f82dede7151"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-linux-amd64.tar.gz"
    sha256 "1c607ad9ce46fd1be77840e59c2efc2fa885c27b02c1da97d78a6fba823a2e0b"
  end

  license "EULA"

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
    EOS
  end

  test do
    # Test that the binary exists and runs
    assert_match "Pixify", shell_output("#{bin}/pixify-pro --version")
  end
end

