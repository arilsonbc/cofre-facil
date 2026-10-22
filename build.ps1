param([string]$Zig = 'zig')
$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    New-Item -ItemType Directory -Force bin | Out-Null
    & $Zig cc -target x86_64-windows-gnu -O0 -fno-inline -s src/cofre.c -o bin/cofre-nivel1.exe
    if ($LASTEXITCODE -ne 0) { throw 'Falha na compilacao.' }
} finally { Pop-Location }
