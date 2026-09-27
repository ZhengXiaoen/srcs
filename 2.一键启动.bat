@echo off
chcp 65001 >nul
setlocal
:select_mode
echo 请选择启动模式：
echo   1. 读取 GameClock.state.json 中的下次游戏时间（默认）
echo   2. 使用当前电脑时间，不调整电脑时钟
set "startMode="
set /p "startMode=请输入 1 或 2，直接回车选 1："
if not defined startMode set "startMode=1"
if "%startMode%"=="1" goto start_game
if "%startMode%"=="2" goto start_game
echo 请输入 1 或 2。
goto select_mode

:start_game
if "%startMode%"=="1" (set "timeSource=Config") else (set "timeSource=System")
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0GameClock.ps1" -Action Start -TimeSource %timeSource% -LauncherWindow
exit /b %errorlevel%
