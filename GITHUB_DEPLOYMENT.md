# GitHub Deployment Guide

This guide will help you publish the STALKER Theme Project to GitHub.

## Pre-Deployment Checklist

### ✓ Completed
- [x] Professional README.md with installation instructions
- [x] MIT License with attributions
- [x] Contribution guidelines (CONTRIBUTING.md)
- [x] Comprehensive documentation (docs/)
- [x] Clean project structure (scripts/, docs/, assets/)
- [x] .gitignore file configured
- [x] Changelog with version history
- [x] One-click installer (install.sh)
- [x] Force-apply script (apply_theme_now.sh)
- [x] All legacy scripts archived

### 📸 Pending (Recommended Before Publishing)
- [ ] Add screenshots to `assets/screenshots/`
  - desktop_overview.png
  - file_manager.png
  - cursor_showcase.png
  - lock_screen.png
  - See `assets/screenshots/README.md` for guidance

### 🎨 Optional Enhancements
- [ ] Add STALKER-themed wallpapers to `assets/wallpapers/`
- [ ] Create animated GIF of cursor animations
- [ ] Add demo video showing installation process
- [ ] Create logo/banner image for README

---

## Step-by-Step GitHub Deployment

### 1. Initialize Git Repository

```bash
cd /home/avinash_7x/Music/evryscript\ but\ shit/STALKER-Theme-Project

# Initialize git
git init

# Add all files (respects .gitignore)
git add .

# Create initial commit
git commit -m "feat: Initial release - Complete STALKER theme suite

- GTK 3/4 theme with muted color palette
- Hexagonal X11 cursor theme with animations
- Aggressive icon color muting (8,297 icons processed)
- GDM lock screen support
- One-click installer and force-apply script
- Comprehensive documentation suite
- STALKER (1979) aesthetic: greens, reds, beiges only"
```

---

### 2. Create GitHub Repository

#### Option A: Via GitHub Website
1. Go to https://github.com/new
2. Repository name: `stalker-theme` (or your preference)
3. Description: *A complete GNOME desktop theme inspired by Andrei Tarkovsky's STALKER (1979)*
4. **Do NOT** initialize with README (we already have one)
5. **Do NOT** add .gitignore or license (we already have them)
6. Click "Create repository"

#### Option B: Via GitHub CLI (gh)
```bash
gh repo create stalker-theme --public --source=. --remote=origin \
  --description="A complete GNOME desktop theme inspired by Andrei Tarkovsky's STALKER (1979)"
```

---

### 3. Link Local Repository to GitHub

Replace `YOUR_USERNAME` with your actual GitHub username:

```bash
# Add remote origin
git remote add origin https://github.com/YOUR_USERNAME/stalker-theme.git

# Verify remote
git remote -v

# Push to GitHub
git branch -M main
git push -u origin main
```

---

### 4. Configure Repository Settings

#### Topics/Tags (for discoverability)
Add these topics in your GitHub repository settings:

- `gnome-theme`
- `gtk-theme`
- `icon-theme`
- `cursor-theme`
- `linux-theme`
- `stalker`
- `tarkovsky`
- `gnome-shell`
- `gtk3`
- `gtk4`
- `papirus-icon-theme`
- `muted-colors`
- `film-aesthetic`
- `retro-theme`
- `linux-desktop`

#### Repository Description
```
🎬 A complete GNOME desktop theme inspired by Andrei Tarkovsky's STALKER (1979) | Muted greens, reds, and beiges | Hexagonal cursors | 8000+ color-muted icons | "Let everything that's been planned come true"
```

#### Website Link (Optional)
If you have a demo page or documentation site:
```
https://your-username.github.io/stalker-theme
```

---

### 5. Create GitHub Release

#### Via GitHub Website
1. Go to your repository
2. Click "Releases" → "Create a new release"
3. Tag: `v1.0.0`
4. Title: `v1.0.0 - Initial Release: Into the Zone`
5. Description:
   ```markdown
   # 🎬 STALKER Theme v1.0.0 - Initial Release
   
   *"Let everything that's been planned come true."*
   
   ## What's Inside
   
   A complete desktop theme suite inspired by Andrei Tarkovsky's 1979 masterpiece *STALKER*. This theme brings the muted, oppressive atmosphere of the Zone to your GNOME desktop.
   
   ### Features
   - ✅ GTK 3/4 Theme with muted color palette
   - ✅ Hexagonal X11 Cursor Theme (60+ cursors)
   - ✅ Color-Muted Icon Theme (8,297 Papirus icons processed)
   - ✅ GDM Lock Screen Support
   - ✅ One-Click Installer
   - ✅ Comprehensive Documentation
   
   ### Quick Install
   ```bash
   git clone https://github.com/YOUR_USERNAME/stalker-theme.git
   cd stalker-theme
   chmod +x install.sh
   ./install.sh
   ```
   
   ### Color Philosophy
   - **Greens**: Survival, the Zone's mutation
   - **Reds**: Danger, contamination
   - **Beiges**: Decay, abandonment
   - **Grey-Greens**: The Zone itself
   - **No Blues**: Hope has no place here
   
   ### Requirements
   - GNOME 40+ (Xorg or Wayland)
   - Python 3 with PIL
   - xcursorgen
   - Papirus Icon Theme
   
   See [README.md](README.md) for full installation and customization guide.
   
   ---
   
   *"May your way be clear and your return certain."*
   ```

6. Click "Publish release"

#### Via GitHub CLI
```bash
gh release create v1.0.0 \
  --title "v1.0.0 - Initial Release: Into the Zone" \
  --notes-file CHANGELOG.md
```

---

### 6. Post-Deployment Tasks

#### Update README with Actual URLs
Once published, update your README.md with real links:

```bash
# In README.md, replace placeholder username
sed -i 's/YOUR_USERNAME/actual-username/g' README.md

# Commit the change
git add README.md
git commit -m "docs: Update README with actual GitHub URLs"
git push
```

#### Add Social Preview Image
1. Create a banner image (1280x640px recommended)
2. Upload to repository or create with GitHub's auto-generator
3. Go to Settings → Options → Social Preview → Upload image

---

### 7. Promote Your Theme

#### Post on Reddit
- r/unixporn - Perfect for theme showcases
- r/gnome - GNOME-specific community
- r/linux - General Linux community

#### Template Post
```markdown
[GNOME] STALKER Theme - Inspired by Tarkovsky's 1979 Film

A complete desktop theme bringing the muted, oppressive atmosphere of the Zone to GNOME.

🎨 Features:
- Muted color palette (only greens, reds, beiges)
- Hexagonal cursor theme with animations
- 8000+ color-muted Papirus icons
- GDM lock screen support
- One-click installer

🔗 GitHub: https://github.com/YOUR_USERNAME/stalker-theme

Details:
- WM: GNOME Shell 4X
- GTK Theme: STALKER-Theme
- Icon Theme: Papirus-Stalker
- Cursor Theme: Stalker-Hex-Minimal

"Let everything that's been planned come true."
```

---

## Maintenance

### Handling Issues
Monitor your GitHub Issues tab. Common questions:
- Installation problems → Direct to docs/TROUBLESHOOTING.md
- Feature requests → Tag with `enhancement`
- Bugs → Tag with `bug`, ask for system info

### Accepting Contributions
See CONTRIBUTING.md for guidelines. Review PRs for:
- Code style consistency
- Adherence to color philosophy
- Proper testing
- Documentation updates

### Version Updates
When making significant changes:

```bash
# Update CHANGELOG.md with new features
# Bump version in README.md

git add .
git commit -m "feat: Add [new feature]

- Description of changes
- Breaking changes (if any)
- Migration guide (if needed)"

git tag v1.1.0
git push origin main --tags

# Create new release on GitHub
gh release create v1.1.0 --generate-notes
```

---

## GitHub Actions (Optional)

Create `.github/workflows/validate.yml` to auto-test scripts:

```yaml
name: Validate Scripts

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y python3-pil xcursorgen shellcheck
      
      - name: Validate bash scripts
        run: |
          shellcheck scripts/*.sh
          shellcheck *.sh
      
      - name: Test Python syntax
        run: |
          python3 -m py_compile scripts/extract_colors.py
      
      - name: Check file permissions
        run: |
          test -x install.sh
          test -x apply_theme_now.sh
```

---

## Analytics (Optional)

Track theme popularity:
- GitHub Stars: Repository stars
- GitHub Clones: Insights → Traffic
- Release Downloads: Each release shows download count

---

## Legal Compliance

✅ **Already Handled:**
- MIT License (permissive, GitHub-friendly)
- Attribution to Papirus and Adwaita
- STALKER film credit in documentation
- No copyrighted assets included

❌ **Do NOT:**
- Include film screenshots/stills (copyright)
- Use official STALKER game assets (trademark)
- Include movie soundtrack/audio (copyright)

---

## Support Channels

Consider setting up:
- GitHub Discussions (for questions/community)
- GitHub Wiki (for extended guides)
- Discord server (optional, for real-time help)

---

## Final Checklist

Before announcing publicly:

- [ ] Repository is public
- [ ] README renders correctly on GitHub
- [ ] All links work (docs/, scripts/)
- [ ] Screenshots added (recommended)
- [ ] License file present
- [ ] Topics/tags configured
- [ ] Repository description set
- [ ] Initial release created (v1.0.0)
- [ ] Tested fresh clone and install on clean system
- [ ] CONTRIBUTING.md reviewed
- [ ] Code of Conduct added (optional: `gh repo create` auto-adds one)

---

*"The Zone wants to be empty. But the repository wants to be found."*

**You're ready to publish! Good luck, Stalker.**
