@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\Update-ClientResourceVersion.ps1"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0GameClock.ps1" -Action Start
