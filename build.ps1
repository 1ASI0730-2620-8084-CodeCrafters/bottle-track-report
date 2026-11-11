# Compila el informe a PDF (Windows).  Uso, desde la raiz del repo:  .\build.ps1
$ErrorActionPreference = 'Stop'

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "pandoc no esta instalado. Ejecuta: winget install --id JohnMacFarlane.Pandoc  (y abre una terminal nueva)"
}

New-Item -ItemType Directory -Force -Path build | Out-Null
pandoc --defaults=config/build.yaml

if ($LASTEXITCODE -eq 0) {
    Write-Host "Listo: build/informe-bottletrack.pdf"
} else {
    Write-Error "Fallo la compilacion (codigo $LASTEXITCODE). Revisa los mensajes de arriba."
}
