$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

codex plugin marketplace add $Root

Write-Host "Codex Goal Command marketplace added."
Write-Host "Restart Codex App"
