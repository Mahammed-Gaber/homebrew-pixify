# Pixify Homebrew Tap

**[English](#english) | [العربية](#arabic)**

---

<div id="english" dir="ltr">

## English

Official Homebrew tap for [Pixify](https://github.com/Mahammed-Gaber/pixify) — High-performance image optimizer.

### Available packages

- **pixify-free**: Free edition with basic features
- **pixify-pro**: Pro edition with advanced features

---

### Installation

#### Install Free Edition
```bash
# Add the tap (first time only)
brew tap mahammed-gaber/pixify

# Install pixify-free
brew install pixify-free
```

Or in one line:
```bash
brew install mahammed-gaber/pixify/pixify-free
```

#### Install Pro Edition
```bash
brew tap mahammed-gaber/pixify
brew install pixify-pro
```

Or in one line:
```bash
brew install mahammed-gaber/pixify/pixify-pro
```

#### Install both
```bash
brew install mahammed-gaber/pixify/pixify-free
brew install mahammed-gaber/pixify/pixify-pro
```

---

### What happens during installation?

- **libvips** is installed automatically (required dependency)
- Binary is downloaded and installed
- Added to your PATH automatically

---

### Usage

**Free edition:**
```bash
pixify-free -i input/ -o output/
pixify-free --help
pixify-free --version
```

**Pro edition:**
```bash
pixify-pro -i input/ -o output/
pixify-pro --help
pixify-pro --version
```

---

### Update / upgrade

```bash
brew upgrade pixify-free
brew upgrade pixify-pro
# Or both
brew upgrade pixify-free pixify-pro
```

---

### Uninstall

```bash
brew uninstall pixify-free
brew uninstall pixify-pro
```

**Note:** Uninstalling does not remove libvips (it may be used by other packages).

---

### Check installed versions

```bash
brew list | grep pixify
brew info pixify-free
brew info pixify-pro
pixify-free --version
pixify-pro --version
```

---

### Links

- [Pixify repository](https://github.com/Mahammed-Gaber/pixify)
- [Report issues](https://github.com/Mahammed-Gaber/pixify/issues)
- [Install libvips guide](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md)

</div>

---

<div id="arabic" dir="rtl">

## العربية

الـ Tap الرسمي لـ [Pixify](https://github.com/Mahammed-Gaber/pixify) — محوّل صور عالي الأداء.

### الحزم المتاحة

- **pixify-free**: النسخة المجانية مع الميزات الأساسية
- **pixify-pro**: النسخة الاحترافية مع ميزات متقدمة

---

### التثبيت

#### تثبيت النسخة المجانية
```bash
# إضافة الـ tap (مرة واحدة فقط)
brew tap mahammed-gaber/pixify

# تثبيت pixify-free
brew install pixify-free
```

أو في سطر واحد:
```bash
brew install mahammed-gaber/pixify/pixify-free
```

#### تثبيت النسخة الاحترافية
```bash
brew tap mahammed-gaber/pixify
brew install pixify-pro
```

أو في سطر واحد:
```bash
brew install mahammed-gaber/pixify/pixify-pro
```

#### تثبيت النسختين
```bash
brew install mahammed-gaber/pixify/pixify-free
brew install mahammed-gaber/pixify/pixify-pro
```

---

### ماذا يحدث أثناء التثبيت؟

- تثبيت **libvips** تلقائياً (الاعتماد المطلوب)
- تحميل وتثبيت البرنامج
- الإضافة إلى PATH تلقائياً

---

### الاستخدام

**النسخة المجانية:**
```bash
pixify-free -i input/ -o output/
pixify-free --help
pixify-free --version
```

**النسخة الاحترافية:**
```bash
pixify-pro -i input/ -o output/
pixify-pro --help
pixify-pro --version
```

---

### التحديث

```bash
brew upgrade pixify-free
brew upgrade pixify-pro
# أو كلاهما
brew upgrade pixify-free pixify-pro
```

---

### إلغاء التثبيت

```bash
brew uninstall pixify-free
brew uninstall pixify-pro
```

**ملاحظة:** إلغاء التثبيت لا يزيل libvips (قد يكون مستخدماً من حزم أخرى).

---

### التحقق من الإصدار

```bash
brew list | grep pixify
brew info pixify-free
brew info pixify-pro
pixify-free --version
pixify-pro --version
```

---

### روابط

- [مستودع Pixify](https://github.com/Mahammed-Gaber/pixify)
- [الإبلاغ عن مشكلة](https://github.com/Mahammed-Gaber/pixify/issues)
- [دليل تثبيت libvips](https://github.com/Mahammed-Gaber/pixify/blob/main/docs/install-libvips.md)

</div>
