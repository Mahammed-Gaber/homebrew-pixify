# Pixify Homebrew Tap

Official Homebrew tap for [Pixify](https://github.com/Mahammed-Gaber/pixify) - High-performance image optimizer.

## 📦 Available Packages

- **pixify-free**: Free edition with basic features
- **pixify-pro**: Pro edition with advanced features

---

## 🚀 Installation

### Install Free Edition
```bash
# Add the tap (first time only)
brew tap mahammed-gaber/pixify

# Install pixify-free
brew install pixify-free
```

**أو في سطر واحد:**
```bash
brew install mahammed-gaber/pixify/pixify-free
```

### Install Pro Edition
```bash
# Add the tap (first time only)
brew tap mahammed-gaber/pixify

# Install pixify-pro
brew install pixify-pro
```

**أو في سطر واحد:**
```bash
brew install mahammed-gaber/pixify/pixify-pro
```

### Install Both Versions
```bash
brew install mahammed-gaber/pixify/pixify-free
brew install mahammed-gaber/pixify/pixify-pro
```

---

## ✅ What Happens During Installation?

Homebrew will automatically:
- ✅ Install **libvips** (required dependency)
- ✅ Download and install the binary
- ✅ Add to your PATH automatically
- ✅ Create symlinks (for pixify-free: `pixify` → `pixify-free`)

**No manual configuration needed!**

---

## 💻 Usage

### Free Edition
```bash
# Using the full name
pixify-free -i input/ -o output/

# Using the symlink (convenience)
pixify -i input/ -o output/

# Convert to WebP
pixify-free -i photo.jpg -o photo.webp

# Get help
pixify-free --help

# Check version
pixify-free --version
```

### Pro Edition
```bash
# Optimize images
pixify-pro -i input/ -o output/

# Convert to WebP
pixify-pro -i photo.jpg -o photo.webp

# Get help
pixify-pro --help

# Check version
pixify-pro --version
```

---

## 🔄 Update / Upgrade

### Update Free Edition
```bash
# Update pixify-free to latest version
brew upgrade pixify-free
```

### Update Pro Edition
```bash
# Update pixify-pro to latest version
brew upgrade pixify-pro
```

### Update Both
```bash
brew upgrade pixify-free pixify-pro
```

### Update All Homebrew Packages
```bash
# Update Homebrew itself
brew update

# Upgrade all packages (including pixify)
brew upgrade
```

### How Updates Work?

**✅ Automatic Cleanup:**
- Homebrew **automatically removes** the old version
- Installs the new version
- Updates symlinks
- **No manual cleanup needed!**

**Example:**
```bash
# Before update
$ pixify-free --version
Pixify Free v1.0.0

# Update
$ brew upgrade pixify-free
==> Upgrading pixify-free
==> Downloading pixify-free v1.1.0
==> Uninstalling pixify-free (1.0.0)
==> Installing pixify-free (1.1.0)
🍺  pixify-free 1.1.0 is now installed

# After update
$ pixify-free --version
Pixify Free v1.1.0
```

---

## 🗑️ Uninstall / Remove

### Uninstall Free Edition
```bash
brew uninstall pixify-free
```

### Uninstall Pro Edition
```bash
brew uninstall pixify-pro
```

### Uninstall Both
```bash
brew uninstall pixify-free pixify-pro
```

**Note:** Uninstalling does **NOT** remove libvips (it might be used by other packages).

---

## 📊 Check Installed Versions

```bash
# List all pixify packages
brew list | grep pixify

# Check specific package info
brew info pixify-free
brew info pixify-pro

# Check versions
pixify-free --version
pixify-pro --version
```

---

## 🔍 Troubleshooting

### Check if installed
```bash
which pixify-free
which pixify-pro
which pixify  # symlink for pixify-free
```

### Reinstall
```bash
brew reinstall pixify-free
brew reinstall pixify-pro
```

### Check for updates
```bash
# Update Homebrew's package list
brew update

# Check outdated packages
brew outdated
```

---

## 📝 Notes

- **libvips** is installed automatically as a dependency
- **pixify-free** creates a symlink `pixify` for convenience
- **pixify-pro** uses only `pixify-pro` command
- Updates are **automatic** - old versions are removed automatically
- Both versions can be installed **simultaneously**

---

## 🔗 Links

- [GitHub Repository](https://github.com/Mahammed-Gaber/pixify)
- [Report Issues](https://github.com/Mahammed-Gaber/pixify/issues)
- [Installation Guide](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md)
