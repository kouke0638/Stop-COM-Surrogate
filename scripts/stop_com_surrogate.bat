@echo off
setlocal EnableExtensions

:: ==========================================================
:: Stop COM Surrogate (dllhost.exe)
:: - Self-elevates to Admin (shows UAC prompt once)
:: - Kills all dllhost.exe processes
:: ==========================================================

:: --- Self-elevate to admin (triggers UAC prompt once) ---
net session >nul 2>&1
if %errorlevel% neq 0 (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process '%~f0' -Verb RunAs"
  exit /b
)

title Stop COM Surrogate (dllhost.exe)

echo [INFO] Killing COM Surrogate (dllhost.exe)...
taskkill /F /IM dllhost.exe >nul 2>&1

if %errorlevel% equ 0 (
  echo [OK] Done.
) else (
  echo [WARN] taskkill returned non-zero. It may mean no dllhost.exe was running, or access was denied.
)

pause
exit /b 0
