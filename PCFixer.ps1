<#
PC Fixer - PowerShell Script
Created by CeresF3B
#>

# Function to display the main menu
function Show-Menu {
    Clear-Host
    Write-Host "-----------------------------------------" -ForegroundColor Cyan
    Write-Host "|             PC FIXER                |" -ForegroundColor Cyan
    Write-Host "|        Created by CeresF3B          |" -ForegroundColor Cyan
    Write-Host "-----------------------------------------" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Select an operation:" -ForegroundColor Yellow
    Write-Host "1. Clean temporary files" -ForegroundColor White
    Write-Host "2. System repairs" -ForegroundColor White
    Write-Host "3. Reset network configurations" -ForegroundColor White
    Write-Host "4. Generate battery report" -ForegroundColor White
    Write-Host "5. Run all operations" -ForegroundColor Magenta
    Write-Host "Q. Exit" -ForegroundColor Red
    Write-Host ""
}

# Function to clean temporary files
function Clean-TempFiles {
    Write-Host "[*] Cleaning temporary files..." -ForegroundColor Yellow
    Remove-Item -Path "$env:TEMP\*" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Temp\*" -Force -Recurse -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\Windows\Prefetch\*" -Force -Recurse -ErrorAction SilentlyContinue
    Write-Host "[+] Cleaning completed!" -ForegroundColor Green
}

# Function for system repairs
function Repair-System {
    Write-Host "[*] Starting system repairs..." -ForegroundColor Yellow
    
    Write-Host "[*] Running SFC /scannow..." -ForegroundColor Yellow
    sfc /scannow
    
    Write-Host "[*] Running DISM /CheckHealth..." -ForegroundColor Yellow
    DISM /Online /Cleanup-Image /CheckHealth
    
    Write-Host "[*] Running DISM /ScanHealth..." -ForegroundColor Yellow
    DISM /Online /Cleanup-Image /ScanHealth
    
    Write-Host "[*] Running DISM /RestoreHealth..." -ForegroundColor Yellow
    DISM /Online /Cleanup-Image /RestoreHealth
    
    Write-Host "[+] System repairs completed!" -ForegroundColor Green
}

# Function for network reset
function Reset-NetworkConfig {
    Write-Host "[*] Resetting network configurations..." -ForegroundColor Yellow
    ipconfig /flushdns
    netsh winsock reset
    netsh int ip reset
    Write-Host "[+] Network reset completed!" -ForegroundColor Green
}

# Function to generate battery report
function Generate-BatteryReport {
    Write-Host "[*] Checking device type..." -ForegroundColor Yellow
    
    # Check if the device has a battery (laptop) or not (desktop)
    $batteryStatus = Get-WmiObject -Class Win32_Battery -ErrorAction SilentlyContinue
    
    if ($batteryStatus) {
        # Device is a laptop
        Write-Host "[*] Laptop detected. Generating battery report..." -ForegroundColor Yellow
        powercfg /batteryreport /output "$env:USERPROFILE\Desktop\BatteryReport.html"
        Write-Host "[+] Battery report successfully generated on Desktop!" -ForegroundColor Green
    } else {
        # Device is a desktop
        Write-Host "[!] Desktop PC detected. Battery report cannot be generated." -ForegroundColor Red
        Write-Host "[!] This feature is only available for laptops with batteries." -ForegroundColor Red
    }
}

# Function to run all operations
function Run-AllOperations {
    Clean-TempFiles
    Repair-System
    Reset-NetworkConfig
    Generate-BatteryReport
}

# Function to exit the program
function Exit-Program {
    Write-Host ""
    Write-Host "[+] All operations completed successfully!" -ForegroundColor Green
    Write-Host "[+] Thank you for using PC Fixer!" -ForegroundColor Green
    Write-Host "[+] Created by CeresF3B" -ForegroundColor Cyan
    
    # Save exit message
    $exitMessage = "Thank you for using PC Fixer! Created by CeresF3B"
    $exitMessage | Out-File -FilePath "$env:TEMP\PCFixerExitMessage.txt"
    
    # Exit with code 200
    exit 200
}

# Main program loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    
    switch ($choice) {
        "1" { Clean-TempFiles; pause }
        "2" { Repair-System; pause }
        "3" { Reset-NetworkConfig; pause }
        "4" { Generate-BatteryReport; pause }
        "5" { Run-AllOperations; pause }
        "Q" { Exit-Program }
        "q" { Exit-Program }
        default { Write-Host "[!] Invalid choice. Try again." -ForegroundColor Red; pause }
    }
} while ($true)
