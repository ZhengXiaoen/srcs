@echo off
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Clean-TestData.ps1"
set "cleanup_exit=%errorlevel%"
pause
exit /b %cleanup_exit%
