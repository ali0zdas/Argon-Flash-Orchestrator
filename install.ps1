$ErrorActionPreference = "Stop"
$RepoUrl = "https://github.com/ali0zdas/Argon-Flash-Orchestrator.git"
$TargetDir = ".agents"

Write-Host "⚡ Installing Argon + Flash Orchestrator into ./$TargetDir..." -ForegroundColor Cyan

$TmpDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
git clone --depth 1 $RepoUrl $TmpDir | Out-Null

New-Item -ItemType Directory -Force -Path "$TargetDir/skills", "$TargetDir/agents", "$TargetDir/commands" | Out-Null

Copy-Item -Path "$TmpDir/skills/*" -Destination "$TargetDir/skills/" -Recurse -Force
Copy-Item -Path "$TmpDir/agents/*" -Destination "$TargetDir/agents/" -Recurse -Force
Copy-Item -Path "$TmpDir/commands/*" -Destination "$TargetDir/commands/" -Recurse -Force

if (-not (Test-Path "AGENTS.md")) {
    Copy-Item -Path "$TmpDir/AGENTS.md" -Destination "./AGENTS.md"
    Write-Host "✅ Created root AGENTS.md" -ForegroundColor Green
}
else {
    Write-Host "ℹ️  AGENTS.md already exists. Merge rules manually if needed." -ForegroundColor Yellow
}

Remove-Item -Path $TmpDir -Recurse -Force
Write-Host "🚀 Argon + Flash Orchestrator installed successfully!" -ForegroundColor Green
