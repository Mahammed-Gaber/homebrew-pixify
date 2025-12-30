# 🚨 Emergency: Input/Output Error - Disk Full

## Problem
Getting `Input/output error` on basic commands like `rm`, `brew`, `vips` means:
- **Disk is 100% full** (most likely)
- **Filesystem corruption** (less likely)
- **Disk hardware failure** (rare)

## ⚠️ Immediate Actions

### Step 1: Check Disk Space (if possible)
```bash
# Try to check disk space
df -h 2>/dev/null || echo "Cannot check - disk full"

# Check specific partition
df -h / 2>/dev/null
df -h /home 2>/dev/null
```

### Step 2: Free Up Space (Critical!)

#### Option A: Delete Homebrew Cache (if accessible)
```bash
# Try to delete Homebrew downloads (may not work if disk full)
# Use full path to avoid PATH issues
/bin/rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/downloads/* 2>/dev/null
/bin/rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/cache/* 2>/dev/null
```

#### Option B: Delete Temporary Files
```bash
# System temp files
/bin/rm -rf /tmp/* 2>/dev/null
/bin/rm -rf /var/tmp/* 2>/dev/null

# User temp files
/bin/rm -rf ~/.cache/* 2>/dev/null
```

#### Option C: Delete Large Files
```bash
# Find large files (if find works)
/usr/bin/find ~ -type f -size +100M 2>/dev/null | head -10

# Delete specific large files manually
```

### Step 3: If Commands Don't Work

#### Use Built-in Shell Commands
```bash
# Use built-in commands (no external binaries)
# These may work even when disk is full

# Check if you can write
echo "test" > /tmp/test.txt 2>&1

# Try to delete files using shell built-ins
# (limited, but may work)
```

### Step 4: Emergency Cleanup Script

Create a cleanup script (if you can write files):

```bash
#!/bin/bash
# emergency-cleanup.sh

echo "Starting emergency cleanup..."

# Homebrew cleanup
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/downloads/* 2>/dev/null
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/cache/* 2>/dev/null
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/locks/* 2>/dev/null

# Temp files
rm -rf /tmp/* 2>/dev/null
rm -rf /var/tmp/* 2>/dev/null

# User cache
rm -rf ~/.cache/* 2>/dev/null

# Log files
find /var/log -type f -name "*.log" -size +10M -delete 2>/dev/null

echo "Cleanup complete. Check space:"
df -h / 2>/dev/null
```

### Step 5: If Nothing Works

#### Restart WSL
```powershell
# In Windows PowerShell (as Administrator)
wsl --shutdown
wsl
```

#### Check Windows Disk Space
- Open Windows File Explorer
- Check C: drive space
- WSL uses Windows disk space!

#### Resize WSL Disk (if needed)
```powershell
# In Windows PowerShell
wsl --shutdown
diskpart
# Then resize WSL disk if needed
```

## 🔧 After Freeing Space

### 1. Verify Disk Space
```bash
df -h
```

### 2. Clean Homebrew Properly
```bash
brew cleanup --prune=all
```

### 3. Remove Incomplete Downloads
```bash
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/locks/*.incomplete.download.lock
```

### 4. Check Filesystem
```bash
# Check for filesystem errors
sudo fsck /dev/sda1  # Adjust device name
```

## 📋 Prevention

### Set Disk Quota for WSL
```powershell
# In Windows PowerShell
wsl --shutdown
# Edit .wslconfig in Windows user directory
```

### Monitor Disk Space
```bash
# Add to ~/.bashrc
alias diskspace='df -h'
alias cleanup='brew cleanup --prune=all'
```

### Regular Cleanup
```bash
# Weekly cleanup
brew cleanup --prune=all
rm -rf ~/.cache/*
```

## 🆘 Last Resort

If nothing works:
1. **Backup important files** (if possible)
2. **Reinstall WSL** (nuclear option)
3. **Use Windows native tools** to free space on C: drive

---

## ✅ Solution: Windows C: Drive is 100% Full

### Problem Identified
```
C:\              96G   95G  212M  100% /mnt/c
```

**Windows C: drive is FULL!** This causes Input/output errors in WSL.

### Immediate Actions (In Windows)

#### 1. Disk Cleanup (Windows Built-in)
```powershell
# In Windows PowerShell (Run as Administrator)
cleanmgr /d C:
```

**Or manually:**
- Press `Win + R`
- Type: `cleanmgr`
- Select C: drive
- Check all boxes
- Click "Clean up system files"

#### 2. Delete Windows Update Files
```powershell
# In Windows PowerShell (Run as Administrator)
# Delete Windows Update cache
Remove-Item -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue

# Delete Windows Update backup files
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
```

#### 3. Delete Temporary Files
```powershell
# In Windows PowerShell
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
```

#### 4. Empty Recycle Bin
- Right-click Recycle Bin → Empty Recycle Bin

#### 5. Delete Large Files/Folders
```powershell
# Find large files in Windows
Get-ChildItem -Path C:\ -Recurse -ErrorAction SilentlyContinue | 
    Where-Object {$_.Length -gt 1GB} | 
    Sort-Object Length -Descending | 
    Select-Object -First 10 FullName, @{Name="Size(GB)";Expression={[math]::Round($_.Length/1GB,2)}}
```

**Common large folders to check:**
- `C:\Users\YourUser\Downloads\`
- `C:\Users\YourUser\AppData\Local\Temp\`
- `C:\ProgramData\Microsoft\Windows\WER\` (Error reports)
- `C:\Windows\Logs\`
- `C:\Windows\System32\LogFiles\`

#### 6. Uninstall Unused Programs
- Settings → Apps → Uninstall unused programs

#### 7. Move Files to Another Drive
If you have D:, G:, or H: drives with space:
- Move Downloads folder to D:
- Move Documents to D:
- Move large files to other drives

### After Freeing Space

1. **Restart WSL:**
```powershell
wsl --shutdown
wsl
```

2. **Verify space:**
```bash
df -h /mnt/c
```

3. **Clean Homebrew:**
```bash
brew cleanup --prune=all
```

4. **Retry installation:**
```bash
brew install pixify-free
```

### Prevention

#### Set WSL Disk Limit
Create `C:\Users\YourUser\.wslconfig`:
```ini
[wsl2]
memory=4GB
processors=2
swap=2GB
localhostForwarding=true
```

#### Regular Windows Cleanup
- Run Disk Cleanup monthly
- Delete temp files regularly
- Monitor C: drive space

---

## 🔍 Check WSL Disk Usage

### Find WSL Disk Size

#### Method 1: From Windows
```powershell
# In Windows PowerShell
# Find WSL virtual disk location
wsl --list --verbose

# Check WSL disk size (usually in AppData)
Get-ChildItem "$env:LOCALAPPDATA\Packages\*WSL*\LocalState\ext4.vhdx" -ErrorAction SilentlyContinue | 
    Select-Object FullName, @{Name="Size(GB)";Expression={[math]::Round($_.Length/1GB,2)}}
```

#### Method 2: From WSL
```bash
# Check total WSL disk usage
du -sh / 2>/dev/null

# Check usage by directory
du -h --max-depth=1 / 2>/dev/null | sort -hr | head -20
```

### Find What's Using Space in WSL

#### 1. Check Homebrew Size
```bash
# Check Homebrew total size
du -sh /home/linuxbrew/.linuxbrew 2>/dev/null

# Check Homebrew Cellar (installed packages)
du -sh /home/linuxbrew/.linuxbrew/Cellar 2>/dev/null

# Check Homebrew cache
du -sh /home/linuxbrew/.linuxbrew/var/homebrew/cache 2>/dev/null

# Check Homebrew downloads
du -sh /home/linuxbrew/.linuxbrew/var/homebrew/downloads 2>/dev/null

# List largest Homebrew packages
du -sh /home/linuxbrew/.linuxbrew/Cellar/* 2>/dev/null | sort -hr | head -10
```

#### 2. Check User Directories
```bash
# Check home directory
du -sh ~ 2>/dev/null

# Check largest files in home
du -ah ~ 2>/dev/null | sort -hr | head -20

# Check Downloads
du -sh ~/Downloads 2>/dev/null

# Check cache
du -sh ~/.cache 2>/dev/null
```

#### 3. Check System Directories
```bash
# Check /var (logs, cache)
du -sh /var 2>/dev/null
du -sh /var/log 2>/dev/null
du -sh /var/cache 2>/dev/null

# Check /tmp
du -sh /tmp 2>/dev/null

# Check /usr
du -sh /usr 2>/dev/null
```

#### 4. Find Largest Files
```bash
# Find files larger than 100MB
find / -type f -size +100M 2>/dev/null | xargs du -h 2>/dev/null | sort -hr | head -20

# Find files larger than 1GB
find / -type f -size +1G 2>/dev/null | xargs du -h 2>/dev/null
```

### Clean WSL Disk Space

#### 1. Clean Homebrew
```bash
# Remove old versions of packages
brew cleanup --prune=all

# Remove cache
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/cache/*

# Remove downloads
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/downloads/*

# Remove incomplete downloads
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/locks/*.incomplete.download.lock

# Uninstall unused packages
brew autoremove
```

#### 2. Clean User Files
```bash
# Clean cache
rm -rf ~/.cache/*

# Clean temp files
rm -rf /tmp/*
rm -rf ~/tmp/*

# Clean old logs
find ~ -name "*.log" -type f -mtime +30 -delete
```

#### 3. Clean System Files
```bash
# Clean apt cache (if using apt)
sudo apt-get clean
sudo apt-get autoremove

# Clean logs
sudo find /var/log -type f -name "*.log" -mtime +30 -delete
sudo find /var/log -type f -name "*.gz" -delete

# Clean old kernels (if any)
sudo apt-get autoremove --purge
```

#### 4. Remove Large Unused Packages
```bash
# List all Homebrew packages
brew list

# Remove specific large package
brew uninstall package-name

# Remove all Homebrew packages (nuclear option)
brew list | xargs brew uninstall
```

### Complete WSL Cleanup Script

```bash
#!/bin/bash
# wsl-cleanup.sh

echo "🧹 Starting WSL cleanup..."

# Homebrew cleanup
echo "Cleaning Homebrew..."
brew cleanup --prune=all 2>/dev/null
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/cache/* 2>/dev/null
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/downloads/* 2>/dev/null
rm -rf /home/linuxbrew/.linuxbrew/var/homebrew/locks/*.incomplete.* 2>/dev/null

# User cleanup
echo "Cleaning user files..."
rm -rf ~/.cache/* 2>/dev/null
rm -rf /tmp/* 2>/dev/null
rm -rf ~/tmp/* 2>/dev/null

# Log cleanup
echo "Cleaning logs..."
find ~ -name "*.log" -type f -mtime +30 -delete 2>/dev/null
sudo find /var/log -type f -name "*.log" -mtime +30 -delete 2>/dev/null
sudo find /var/log -type f -name "*.gz" -delete 2>/dev/null

# Show space saved
echo ""
echo "✅ Cleanup complete!"
echo "Current disk usage:"
df -h /
```

### Check WSL Disk Usage Summary

```bash
# Run this to see what's using space
echo "=== WSL Disk Usage Summary ==="
echo ""
echo "Total WSL usage:"
du -sh / 2>/dev/null
echo ""
echo "Top 10 largest directories:"
du -h --max-depth=1 / 2>/dev/null | sort -hr | head -10
echo ""
echo "Homebrew size:"
du -sh /home/linuxbrew/.linuxbrew 2>/dev/null
echo ""
echo "User home size:"
du -sh ~ 2>/dev/null
echo ""
echo "Largest files (>100MB):"
find / -type f -size +100M 2>/dev/null | xargs du -h 2>/dev/null | sort -hr | head -10
```

### Shrink WSL Disk (Windows)

After cleaning, you can shrink the WSL virtual disk:

```powershell
# In Windows PowerShell (Run as Administrator)
# 1. Shutdown WSL
wsl --shutdown

# 2. Optimize WSL disk
Optimize-VHD -Path "$env:LOCALAPPDATA\Packages\*WSL*\LocalState\ext4.vhdx" -Mode Full
```

**Note:** Replace `*WSL*` with actual WSL package name (e.g., `CanonicalGroupLimited.Ubuntu*`)

