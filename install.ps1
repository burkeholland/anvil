$ErrorActionPreference = "Stop"

$repo = "burkeholland/anvil"
$file = ".github/agents/anvil.agent.md"
$url = "https://raw.githubusercontent.com/$repo/main/$file"

if ($args -contains "global" -or $env:ANVIL_GLOBAL -eq '1') {
    $dir = Join-Path $env:USERPROFILE ".copilot\agents"
    Write-Host "Installing Anvil agent globally -> $dir"
    Remove-Item Env:\ANVIL_GLOBAL -ErrorAction SilentlyContinue
} else {
    $dir = ".copilot\agents"
    Write-Host "Installing Anvil agent locally -> $dir"
}

New-Item -ItemType Directory -Path $dir -Force | Out-Null
Invoke-WebRequest -Uri $url -OutFile (Join-Path $dir "anvil.agent.md") -UseBasicParsing

Write-Host "Installed. Run 'copilot' and select the Anvil chat mode."
