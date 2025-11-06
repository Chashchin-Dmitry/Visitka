# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **zero-dependency static digital business card** for Dmitry Chashchin (CTO at BVMax). The entire application is contained in a single HTML file with embedded CSS, designed for GitHub Pages deployment.

**Key characteristics:**
- Pure HTML5 + CSS3 (no build process, no package.json, no dependencies)
- Single-file architecture: `index.html` contains all markup and styles
- Static site hosted on GitHub Pages
- Russian language content
- BVMax corporate branding (colors: #ff8502 orange, #114efe blue)

## Architecture

**Single-Page Design:**
- All CSS is embedded in `<style>` tags within `index.html`
- No JavaScript required
- External dependencies: Google Fonts (Inter) and BVMax logo from CDN
- Profile image loaded from `assets/images/profile.jpg`

**Design System:**
- CSS custom properties (`--primary-orange`, `--primary-blue`, etc.) in `:root`
- Mobile-first responsive design with `@media` queries
- CSS animations (`@keyframes slideUp`) for page load
- Gradient backgrounds and hover effects

## Development Workflow

**Making Changes:**
1. Edit `index.html` directly (no build step required)
2. Test locally: `open index.html` in browser
3. Commit and push to GitHub: `git add . && git commit -m "message" && git push`
4. GitHub Pages auto-deploys in 1-2 minutes

**No package manager or build tools** - this is intentional for simplicity.

## QR Code Generation

The project includes `generate_qr.py` for creating QR codes:

```bash
python3 generate_qr.py
```

**Generates 3 versions:**
- `qr_code.png` - Standard version (974 bytes)
- `qr_code_print.png` - High-res for printing (1200x1200px)
- `qr_code_iphone_wallpaper.png` - Large margins for iPhone lock screen (1500x1500px)

**Requirements:** `pip3 install --user qrcode[pil]`

The QR codes link to: `https://chashchin-dmitry.github.io/Visitka/`

## Deployment

**GitHub Pages Configuration:**
- Repository: https://github.com/Chashchin-Dmitry/Visitka
- Branch: `master` (not `main` - this project uses master)
- Deploy from: `/ (root)` directory
- Live URL: https://chashchin-dmitry.github.io/Visitka/

**Using deploy.sh:**
The project includes `deploy.sh` for automated setup, but the repository is already initialized and deployed. This script is mainly for reference or re-deployment scenarios.

## Content Updates

**Contact Information:**
All contact details are in `index.html` within the `.card-body` section:
- Phone: `tel:+79670047879`
- Email: `mailto:cdv.inbox@gmail.com`
- WhatsApp: `https://wa.me/79670047879`
- Telegram personal: `https://t.me/tchashchin`
- Telegram channel: `https://t.me/notes_from_cto`
- LinkedIn: `https://www.linkedin.com/in/dmitrii-chashchin-02844125b/`
- Website: `https://bvmax.ru`

**Profile Information:**
- Name: "Дмитрий Чащин"
- Title: "Chief Technology Officer"
- Tagline: "Раскрепощаем внедрять ИИ в бизнес!"

**BVMax Branding:**
- Logo URL: `https://static.tildacdn.com/tild3138-3632-4136-a636-366330356634/Frame_8.svg`
- If logo changes, update the `<img>` src in `.card-header`

## File Structure

```
digital-card/
├── index.html                      # Single-page app (all HTML + CSS)
├── assets/images/profile.jpg       # User profile photo (80KB)
├── generate_qr.py                  # QR code generator script
├── qr_code.png                     # Standard QR code
├── qr_code_print.png              # Print-ready QR code
├── qr_code_iphone_wallpaper.png   # iPhone wallpaper QR code
├── deploy.sh                       # Deployment automation script
└── README.md                       # User-facing documentation (Russian)
```

## Important Constraints

1. **No build process** - Never introduce npm, webpack, or any bundlers
2. **Single HTML file** - Keep all CSS embedded (don't extract to separate file)
3. **Language** - All user-facing content must be in Russian
4. **Branding** - Maintain BVMax color scheme and visual identity
5. **Mobile-first** - Test responsive design for iPhone/Android screens

## Testing

**Local Testing:**
```bash
# macOS
open index.html

# Linux
xdg-open index.html

# Or just double-click the file
```

**Mobile Testing:**
- Use browser DevTools responsive mode
- Test breakpoint: 480px (see `@media` query)

## Git Workflow

**Current branch:** `master` (not main)

**Typical workflow:**
```bash
git add index.html
git commit -m "Update contact information"
git push
```

Wait 1-2 minutes for GitHub Pages to rebuild.

## Common Tasks

**Update contact details:** Edit `index.html` lines 213-233 (contact links)

**Change colors:** Modify CSS custom properties in `:root` (lines 17-24)

**Update profile photo:** Replace `assets/images/profile.jpg` (recommended: 500x500px, <500KB)

**Regenerate QR codes:** Run `python3 generate_qr.py` (updates all 3 versions)

**Change URL in QR codes:** Edit `generate_qr.py` line 6, then regenerate
