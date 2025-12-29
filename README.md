# Pixify Homebrew Tap

Official Homebrew tap for [Pixify](https://github.com/Mahammed-Gaber/Pixify) - High-performance image optimizer.

## Installation
```bash
brew install mahammed-gaber/pixify/pixify
```

That's it! Homebrew will automatically:
- ✅ Install libvips (latest version)
- ✅ Install Pixify
- ✅ Add to PATH

## Usage
```bash
# Optimize images
pixify -i input/ -o output/

# Convert to WebP
pixify -i photo.jpg -o photo.webp

# Get help
pixify --help
```

## Update
```bash
brew upgrade pixify
```

## Uninstall
```bash
brew uninstall pixify
```

## Support

For issues, visit: https://github.com/Mahammed-Gaber/Pixify/issues