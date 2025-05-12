# PC Fixer 🛠️

[![Windows 10/11](https://img.shields.io/badge/Windows-10%2F11-blue?logo=windows)](https://www.microsoft.com/windows)
[![Maintenance](https://img.shields.io/badge/Maintenance-Active-green.svg)](https://github.com/CeresF3b/PC-Fixer)
[![License](https://img.shields.io/badge/License-GPL--3.0-yellow.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Overview

PC Fixer is a simple tool designed to maintain and optimize your Windows PC. Created by CeresF3B, it performs various system maintenance tasks with just a few clicks.



## Features

### One-Click Maintenance
Fully automated or customizable system maintenance.

### Core Functions

| Function | Description |
|----------|-------------|
| 🗑️ **Temp/Prefetch Cleanup** | Aggressively removes unnecessary files from %TEMP%, Windows\Temp and Prefetch |
| 🔧 **System Repairs** | • SFC /scannow for file integrity checks<br>• DISM /CheckHealth for initial system health assessment<br>• DISM /ScanHealth for deeper system scanning<br>• DISM /RestoreHealth for complete OS image repair |
| 🌐 **Network Reset** | Flushes DNS cache, resets Winsock and IP configurations |
| 🔋 **Battery Report** | Generates HTML diagnostic report on battery health |
| ⚡ **Full Auto Mode** | Runs all tasks in sequence for hands-off maintenance |

### Easy to Use

- Interactive menu with colored status updates (✅ success, ❌ errors)
- Automatic admin rights elevation via batch file
- Clear exit message with thank you note

## Usage

### No Technical Knowledge Required
Designed for all users regardless of computer experience.

### Simple Operations
1. Double-click `PCFixer_Launcher.bat` (no manual admin rights needed)
2. When prompted, click "Yes" to allow admin permissions
3. Choose an option by typing the number (1-5) or Q to exit
4. Wait for the selected operation to complete

### Direct PowerShell Execution
```powershell
irm https://raw.githubusercontent.com/CeresF3b/PC-Fixer/main/PCFixer.ps1 | iex
```
- Script runs directly without downloading any files
- Follow on-screen menu instructions

### Options
- **Quick Fix**: Select 5 for full automatic maintenance
- **Manual Control**: Choose specific tasks (1-4)
- **Exit**: Press Q to exit with a thank you message

### Rubber Ducky Version
- Uses `PCFixer_RubberDucky.txt` file for automation via Rubber Ducky devices

## System Requirements
- Windows 10 or Windows 11
- Administrator privileges (automatically requested by launcher)

## Notes
- Battery report function is only useful for laptop users
- Some operations may take several minutes to complete
- All operations are safe and follow Microsoft-recommended maintenance procedures

## License
Distributed under GPL-3.0 License. See `LICENSE` for more information.

## Acknowledgments
Created with ❤️ by CeresF3B
