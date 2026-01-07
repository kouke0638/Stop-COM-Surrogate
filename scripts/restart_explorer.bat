@echo off
setlocal EnableExtensions

:: Restart Windows Explorer (often fixes thumbnail/preview hangs)
title Restart Explorer

echo [INFO] Restarting Explorer...
taskkill /F /IM explorer.exe >nul 2>&1
start "" explorer.exe

echo [OK] Done.
pause
exit /b 0
