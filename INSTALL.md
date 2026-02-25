# Installation sur Windows et macOS

Ce projet Flutter fournit maintenant des **installateurs desktop** :

- **Windows** : un installeur `.exe`
- **macOS** : un `.dmg` avec installation par **drag & drop** vers Applications

## 1) Option recommandée : télécharger les installateurs générés automatiquement

Le workflow GitHub Actions `.github/workflows/desktop-build.yml` produit :

- `prono-windows-installer-exe` → contient `prono-windows-setup.exe`
- `prono-macos-dmg` → contient `prono-macos.dmg`

### Où les récupérer

1. Va dans l'onglet **Actions** du repo.
2. Ouvre le workflow **Build Desktop Installers**.
3. Télécharge l'artifact correspondant à ton OS.

### Installation utilisateur finale

#### Windows

1. Dézippe l'artifact si nécessaire.
2. Lance `prono-windows-setup.exe`.
3. Suis l'assistant d'installation.
4. Démarre l'app depuis le menu Démarrer (ou icône bureau si cochée).

#### macOS

1. Ouvre `prono-macos.dmg`.
2. Glisse `prono.app` vers `Applications` (drag & drop).
3. Lance l'app depuis Applications.

---

## 2) Build local (développeur)

## Prérequis

- Flutter SDK (stable)
- Git
- IDE recommandé : VS Code ou Android Studio

Vérifie ton environnement :

```bash
flutter doctor
```

### Windows local

Prérequis supplémentaires :

- Visual Studio 2022 avec **Desktop development with C++**
- Inno Setup 6 (pour générer l'installeur `.exe`)

Commandes :

```powershell
flutter config --enable-windows-desktop
flutter create --platforms=windows .
flutter pub get
flutter build windows --release
"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" ".\packaging\windows\prono.iss"
```

Installeur généré :

- `dist/windows/prono-windows-setup.exe`

### macOS local

Prérequis supplémentaires :

- Xcode + Command Line Tools
- `create-dmg` (installable via Homebrew)

Commandes :

```bash
flutter config --enable-macos-desktop
flutter create --platforms=macos .
flutter pub get
flutter build macos --release
brew install create-dmg
create-dmg \
  --overwrite \
  --volname "Prono" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "prono.app" 200 190 \
  --hide-extension "prono.app" \
  --app-drop-link 600 185 \
  "dist/prono-macos.dmg" \
  "build/macos/Build/Products/Release/"
```

DMG généré :

- `dist/prono-macos.dmg`
