REM PC Fixer - Rubber Ducky Script
REM UAC Auto-Confirm Fix for Italian Systems
REM Created by CeresF3B

DELAY 1000
GUI r
DELAY 500

STRING powershell
DELAY 300
CTRL-SHIFT ENTER
DELAY 3500

REM Select "Yes" in UAC with explicit navigation
TAB
DELAY 100
TAB
DELAY 100
ENTER
DELAY 2000

REM Execute the remote script
STRING irm https://raw.githubusercontent.com/CeresF3b/PC-Fixer/main/PCFixer.ps1 | iex
ENTER
