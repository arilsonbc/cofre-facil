$ErrorActionPreference = 'Stop'
$exe = Join-Path $PSScriptRoot 'bin/cofre-nivel1.exe'
$cases = @(
    @{ Name='correta'; Input="chave2026`n`n"; Code=0; Text='ACESSO LIBERADO!' },
    @{ Name='incorreta'; Input="errada`n`n"; Code=1; Text='ACESSO NEGADO!' },
    @{ Name='vazia'; Input="`n`n"; Code=1; Text='ACESSO NEGADO!' },
    @{ Name='longa'; Input=(('A' * 300) + "`n`n"); Code=1; Text='ACESSO NEGADO!' }
)
foreach ($case in $cases) {
    $output = $case.Input | & $exe
    if ($LASTEXITCODE -ne $case.Code -or ($output -join "`n") -notlike "*$($case.Text)*") {
        throw "Falhou: $($case.Name)"
    }
    Write-Host "OK: $($case.Name)"
}
