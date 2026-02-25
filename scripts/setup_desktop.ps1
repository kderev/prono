$ErrorActionPreference = "Stop"

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  Write-Error "Flutter n'est pas installé ou absent du PATH."
}

Write-Host "Activation Windows desktop..."
flutter config --enable-windows-desktop
flutter create --platforms=windows .
Write-Host "Terminé. Lance ensuite: flutter run -d windows"
