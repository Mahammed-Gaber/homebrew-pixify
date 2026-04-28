class PixifyFree < Formula
  desc "High-performance image optimizer and converter (Free Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-arm64.tar.gz"
      sha256 "8afa893bd658f0f207808166ef330aac4c3b5b868e8dddb32fec64be30b8a390"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-darwin-amd64.tar.gz"
      sha256 "44f0b44491f4ef6d05b521f2241d8b4f48a4854039b2f84c4cb4e37789b632ce"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-free-linux-amd64.tar.gz"
    sha256 "50cd9a3a44eaffdf4f3424ed3988f2ab06ca7a1677c6460ced099d61e77d6aea"
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

