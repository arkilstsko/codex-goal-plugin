$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Get-Command codex -ErrorAction SilentlyContinue)) {
    throw "Codex CLI was not found on PATH. Install or open a shell where the 'codex' command is available."
}

codex plugin marketplace add $Root

Write-Host "Codex Goal Command marketplace added."
Write-Host "Restart Codex App"
