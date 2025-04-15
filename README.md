# PC Fixer

## Overview
PC Fixer is a simple and intuitive tool designed to help maintain and optimize your Windows PC. Created by CeresF3B and improved by Trae AI, this tool performs various system maintenance tasks with just a few clicks.

## Features

- **One-Click Maintenance**: Fully automated or customizable system optimization.

- **Main Functions**:

    - 🗑️ **Temp/Prefetch Cleaning**: Aggressively removes junk files from %TEMP%, Windows\Temp, and Prefetch.

    - 🔧 **System Repairs**:
        - SFC /scannow for file integrity checks.
        - DISM /CheckHealth for an initial system health assessment.
        - DISM /ScanHealth for a more thorough system scan.
        - DISM /RestoreHealth for complete operating system image repair.

    - 🌐 **Network Reset**: Flushes DNS cache, resets Winsock and IP configurations.

    - 🔋 **Battery Report**: Generates an HTML diagnostic report on battery health.
    
    - ⚡ **Full Automatic Mode**: Runs all tasks in sequence for hands-free maintenance.

- **Easy to Use**:

    - Interactive menu with colored status updates (✅ success, ❌ errors).

    - Automatic administrator rights elevation through batch file.

    - Clear exit message with thank you note.
    
    - Also available in Rubber Ducky version for advanced automation.

## Usage

- **No Technical Knowledge Required**: This tool is designed for all users, regardless of computer experience.

- **Simple Operation**:
    1 Double-click on `PCFixer_Launcher.bat` (no manual administrator rights needed).
    2 When prompted, click "Yes" to allow administrator permissions.
    3 Choose an option from the menu by typing the number (1-5) or Q to exit.
    4 Wait for the selected operation to complete.

- **Options**:
    - **Quick Fix**: Select 5 for full automatic maintenance.
    - **Manual Control**: Choose specific tasks (1-4).
    - **Exit**: Press Q to exit with a thank you message.
    
- **Rubber Ducky Version**:
    - Use the `PCFixer_Unified_RubberDucky.txt` file for automation via Rubber Ducky devices.

## System Requirements
- Windows 10 or Windows 11
- Administrator privileges (automatically requested by the launcher)

## Notes
- The battery report function is only useful for laptop users
- Some operations may take several minutes to complete
- All operations are safe and follow Microsoft's recommended maintenance procedures
- The unified version offers an improved interface and additional features compared to the original versions
- Rubber Ducky script is available for advanced automation
