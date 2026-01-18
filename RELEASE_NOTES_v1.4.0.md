# Sip v1.4.0 Release Notes

## 📥 Bookmark Import Wizard

The highlight of this release is the new **Bookmark Import Wizard** that makes it incredibly easy to migrate your existing bookmarks into Sip!

### Features

- **One-Click Import Process**
  - Simply select your browser's HTML bookmark export file
  - Drag & drop support for easy file upload
  
- **Smart Category Detection**
  - Automatically converts bookmark folders into categories
  - Preserves your existing bookmark organization
  - Handles nested folder structures recursively
  
- **Interactive Preview & Selection**
  - Preview all detected bookmarks before importing
  - Category-level checkboxes to select/deselect entire folders
  - Individual link checkboxes for fine-grained control
  - "Select All" and "Deselect All" convenience buttons
  - Real-time count of bookmarks and categories
  
- **Intelligent Merging**
  - Seamlessly merges with existing categories
  - If a category with the same name exists, adds links to it
  - Creates new categories for unique bookmark folders
  - Prevents duplicate links (URL-based detection)
  
- **Multi-Browser Support**
  - Works with HTML bookmark exports from:
    - Google Chrome
    - Mozilla Firefox
    - Microsoft Edge
    - Apple Safari

### How to Use

1. Export your bookmarks as HTML from your current browser
2. Open Sip Settings → General tab
3. Click "Import Bookmarks"
4. Select or drag your HTML bookmark file
5. Review the parsed bookmarks and uncheck any you don't want
6. Click "Import Selected"
7. Edit category names and links as needed through Settings

### UI/UX Improvements

- **Unified Button Styling**
  - All action buttons in Settings now have consistent appearance
  - Matches the toggle button style throughout the interface
  - Backup/Restore and Import buttons redesigned for uniformity
  - Background Image controls updated to match

- **Better Layout**
  - Action buttons positioned on the right side like other controls
  - Cleaner, more organized General and Appearance tabs
  - Improved visual hierarchy

### Technical Details

- Modal-based wizard interface with two steps (upload → preview)
- HTML parser using DOMParser for safe bookmark file processing
- Scrollable preview area with custom styling
- Responsive design for mobile devices
- All data stored locally (no external services)

---

## Installation

### Firefox Add-ons Store
Submit the packaged `sip-v1.4.0-firefox.zip` file to the Firefox Add-ons store.

### Manual Installation
1. Download `sip-v1.4.0-firefox.zip`
2. Extract to a local folder
3. In Firefox, navigate to `about:debugging#/runtime/this-firefox`
4. Click "Load Temporary Add-on"
5. Select `manifest.json` from the extracted folder

---

## Changelog

### Added
- Bookmark Import Wizard feature
  - HTML bookmark file parser
  - Category and link detection from folder structure
  - Interactive preview with checkboxes
  - Selective import functionality
  - Duplicate prevention
- Unified action button styling across Settings tabs

### Changed
- Updated Backup & Restore layout to match other settings
- Updated Background Image controls styling
- Improved General tab organization
- Updated manifest.json to v1.4.0
- Updated README.md with new feature documentation

### Fixed
- Scrolling in Import Wizard modal
- Consistent button appearance throughout Settings

---

## Package Contents

- `index.html` - Main startpage
- `manifest.json` - Extension manifest (v1.4.0)
- `script.js` - Application logic including bookmark parser
- `style.css` - Complete styling including wizard UI
- `PRIVACY.md` - Privacy policy
- `README.md` - Documentation
- `icons/` - Extension icons (16, 32, 48, 128px)
- `fonts/` - Nerd Font Symbols
- `assets/` - Additional resources

---

## Privacy & Permissions

**No new permissions required**

Sip continues to respect your privacy:
- ✅ No data collection or tracking
- ✅ All data stored locally in your browser
- ✅ No external API calls (except optional OpenWeather)
- ✅ No analytics or telemetry
- ✅ Open source and transparent

---

Made with ☕ and 💜 by Bryan Gibson
