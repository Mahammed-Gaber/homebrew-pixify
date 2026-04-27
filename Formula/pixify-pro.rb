class PixifyPro < Formula
  desc "High-performance image optimizer and converter (Pro Edition)"
  homepage "https://github.com/Mahammed-Gaber/pixify"
  version "1.0.0"
  
  on_macos do
    on_arm do
      # Apple Silicon (M1/M2/M3)
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-arm64.tar.gz"
      sha256 "37bea6953900b139b83f9fcbc4392d89df79d3caabe8cdeab69269ab0ca9d28c"
    end
    
    on_intel do
      # Intel Mac
      url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-darwin-amd64.tar.gz"
      sha256 "f870d9b5445393cd1e2c8e6f0356668b5fa735b8ec6db84bf356580416306b47"
    end
  end

  on_linux do
    # Currently only x86_64 Linux is built
    # ARM Linux support may be added in the future
    url "https://github.com/Mahammed-Gaber/pixify/releases/download/v1.0.0/pixify-pro-linux-amd64.tar.gz"
    sha256 "64d7b9105ca2541ca97c9b323043a59bd606fc186c8ce785fa937a046e154d53"
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

