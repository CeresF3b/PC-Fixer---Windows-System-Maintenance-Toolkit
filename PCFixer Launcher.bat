@echo off
@setlocal enabledelayedexpansion

title PC Fixer - CeresF3B
cls

echo -----------------------------------------
echo ^|             PC FIXER                ^|
echo ^|        Created by CeresF3B          ^|
echo -----------------------------------------
echo.
echo [*] Initializing PC Fixer...
timeout /t 1 >nul

:: Check if PowerShell script exists
if not exist "%~dp0PCFixer.ps1" (
    echo [!] ERROR: PCFixer.ps1 not found in this folder.
    echo [*] Path checked: %~dp0
    pause
    exit /b 1
)

:: Create a flag file to detect if PowerShell was closed with X
echo 1 > "%TEMP%\PCFixerRunning.tmp"

:: Launch PowerShell script with admin rights
echo [*] Requesting administrator privileges...
powershell -Command "Start-Process -Verb RunAs -WindowStyle Normal -Wait -FilePath 'powershell.exe' -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0PCFixer.ps1\"'"

:: Delete the running flag file
if exist "%TEMP%\PCFixerRunning.tmp" del "%TEMP%\PCFixerRunning.tmp"

:: Check for exit code 200 which indicates normal exit with message
if %ERRORLEVEL% equ 200 (
    :: Read the thank you message from the temp file if it exists
    set "messageFile=%TEMP%\PCFixerExitMessage.txt"
    if exist "!messageFile!" (
        echo.
        for /f "usebackq delims=" %%a in ("!messageFile!") do (
            echo [+] %%a
        )
        echo.
        :: Delete the temp file after reading
        del "!messageFile!" >nul 2>&1
    )
    echo [+] Closing all windows in 3 seconds...
    timeout /t 3 >nul
    exit /b 0
) else if exist "%TEMP%\PCFixerExitMessage.txt" (
    :: PowerShell was closed with X but we still have the exit message
    echo.
    for /f "usebackq delims=" %%a in ("%TEMP%\PCFixerExitMessage.txt") do (
        echo [+] %%a
    )
    echo.
    del "%TEMP%\PCFixerExitMessage.txt" >nul 2>&1
    echo [+] Closing all windows in 3 seconds...
    timeout /t 3 >nul
    exit /b 0
) else if %ERRORLEVEL% neq 0 (
    echo [!] Failed to launch (Error Code: %ERRORLEVEL%)
    pause
)

endlocal
exit /b
