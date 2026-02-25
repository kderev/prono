#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter n'est pas installé ou absent du PATH."
  exit 1
fi

OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  echo "Activation macOS desktop..."
  flutter config --enable-macos-desktop
  flutter create --platforms=macos .
  echo "Terminé. Lance ensuite: flutter run -d macos"
else
  echo "Script shell prévu pour macOS."
  echo "Pour Windows, utilise scripts/setup_desktop.ps1"
fi
