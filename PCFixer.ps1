<#
.SYNOPSIS
    Windows PC Maintenance Toolkit
.DESCRIPTION
    Author: CeresF3B
    Version: 8.1
#>

# Check for administrator rights
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[ERROR] Run as Administrator!" -ForegroundColor Red
    Read-Host " Press ENTER to exit"
    exit
}

# Delete Temp/Prefetch files
function Clear-SystemJunk {
    $targetPaths = @(
        "$env:TEMP\*",
        "$env:SystemRoot\Temp\*",
        "$env:SystemRoot\Prefetch\*"
    )

    foreach ($path in $targetPaths) {
        try {
            if (Test-Path $path) {
                Write-Host "[*] Cleaning: $path" -ForegroundColor Cyan
                Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue | 
                Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
                Write-Host "[+] Cleaned successfully" -ForegroundColor Green
            }
        }
        catch {
            Write-Host "[!] Error: Failed to clean ${path}: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Run SFC
function Repair-SystemFiles {
    Write-Host "[*] Running System File Checker (SFC)..." -ForegroundColor Yellow
    Start-Process "sfc" -ArgumentList "/scannow" -NoNewWindow -Wait
}

# Run DISM
function Repair-SystemImage {
    Write-Host "[*] Repairing system with DISM..." -ForegroundColor Magenta
    Start-Process "DISM" -ArgumentList "/Online /Cleanup-Image /RestoreHealth" -NoNewWindow -Wait
}

# Reset network
function Reset-NetworkStack {
    Write-Host "[*] Resetting network configuration..." -ForegroundColor Green
    Start-Process "ipconfig" -ArgumentList "/flushdns" -NoNewWindow -Wait
    Start-Process "netsh" -ArgumentList "winsock reset" -NoNewWindow -Wait
    Start-Process "netsh" -ArgumentList "int ip reset" -NoNewWindow -Wait
    Write-Host "[!] Reboot your PC to apply changes" -ForegroundColor Yellow
}

# Generate battery report
function Get-BatteryHealth {
    Write-Host "[*] Generating battery report..." -ForegroundColor Gray
    Start-Process "powercfg" -ArgumentList "/batteryreport" -NoNewWindow -Wait
    Write-Host "[+] Report saved to: $pwd\battery-report.html" -ForegroundColor Green
}

# Execute all functions automatically
function Invoke-FullMaintenance {
    Write-Host "[*] Starting full system maintenance...`n" -ForegroundColor Cyan
    Clear-SystemJunk
    Repair-SystemFiles
    Repair-SystemImage
    Reset-NetworkStack
    Get-BatteryHealth
    Write-Host "`n[+] All tasks completed!`n" -ForegroundColor Green
}

# Interactive menu
function Show-MainMenu {
    do {
        Clear-Host
        Write-Host "===== PC Fixer =====" -ForegroundColor Cyan
        Write-Host "1. Clean Temp/Prefetch Folders"
        Write-Host "2. Run System File Checker (SFC)"
        Write-Host "3. Repair System Image (DISM)"
        Write-Host "4. Reset Network Configuration"
        Write-Host "5. Generate Battery Report"
        Write-Host "6. Run All Maintenance Tasks"
        Write-Host "Q. Exit"
        
        $choice = Read-Host "`n Select an option"
        switch ($choice) {
            "1" { Clear-SystemJunk }
            "2" { Repair-SystemFiles }
            "3" { Repair-SystemImage }
            "4" { Reset-NetworkStack }
            "5" { Get-BatteryHealth }
            "6" { Invoke-FullMaintenance }
            "Q" { 
                Write-Host "`n[+] Thank you for using PC Fixer! Exiting...`n" -ForegroundColor Green
                exit 
            }
            default {
                Write-Host "[!] Invalid option!" -ForegroundColor Red
                Start-Sleep -Seconds 1
            }
        }
        if ($choice -ne "Q") {
            Read-Host "`n Press ENTER to continue..."
        }
    } while ($true)
}

# Start the toolkit
Show-MainMenu