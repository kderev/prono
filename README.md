# Prono Awards (Flutter UI)

A premium, minimalist cross-platform Flutter UI concept inspired by the cinematic visual language of major film awards.

## Architecture choices (short)

- **Feature-first + clean separation**:
  - `core/`: app-wide routing and theming.
  - `features/home`: placeholder data (`data`), entity (`domain`), UI (`presentation`).
  - `features/details`: separate screen module for navigation example.
- **Material 3** with a custom dark-gold palette and typography hierarchy.
- **Reusable components** under `presentation/widgets`, including an animated CTA button and item card.
- **Responsive UI** using breakpoint-based desktop grid / mobile list.

## Installer l'app sur PC (Windows) ou Mac

Tu peux récupérer de vrais installateurs desktop :

- **Windows** : installeur `.exe`
- **macOS** : `.dmg` avec installation par glisser-déposer vers `Applications`

### Option A — Télécharger les installateurs depuis GitHub Actions

Le workflow `.github/workflows/desktop-build.yml` génère automatiquement :

- `prono-windows-installer-exe` (contient `prono-windows-setup.exe`)
- `prono-macos-dmg` (contient `prono-macos.dmg`)

### Option B — Générer localement

Consulte le guide détaillé : [`INSTALL.md`](INSTALL.md).

## Key files

- `lib/main.dart`
- `lib/core/theme/theme.dart`
- `lib/features/home/presentation/home_screen.dart`
- `lib/features/home/presentation/widgets/premium_button.dart`
- `lib/features/home/presentation/widgets/award_item_card.dart`

## App icon placeholder

A placeholder icon asset is provided at:

- `assets/icons/app_icon_placeholder.svg`

You can wire this into platform launchers with a tool like `flutter_launcher_icons` later.
