@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0GameClock.ps1" -Action Restart -SelectStartMode -LauncherWindow
exit /b %errorlevel%
