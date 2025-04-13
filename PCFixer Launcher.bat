@echo off
@setlocal enabledelayedexpansion

title PC Fixer - CeresF3B
cls

echo [*] Initializing PC Fixer...
timeout /t 1 >nul

:: Check if PowerShell script exists
if not exist "%~dp0PCFixer.ps1" (
    echo [!] ERROR: PCFixer.ps1 not found in this folder.
    echo [*] Path checked: %~dp0
    pause
    exit /b 1
)

:: Launch PowerShell script with admin rights
echo [*] Requesting administrator privileges...
powershell -Command "Start-Process -Verb RunAs -WindowStyle Normal -FilePath 'powershell.exe' -ArgumentList '-NoExit -ExecutionPolicy Bypass -File \"%~dp0PCFixer.ps1\"'"

:: Error handling
if %ERRORLEVEL% neq 0 (
    echo [!] Failed to launch (Error Code: %ERRORLEVEL%)
    pause
)

endlocal
exit /b