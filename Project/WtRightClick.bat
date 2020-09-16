@echo off
cd %~dp0
SET ps1Path=%CD%\WtRightClick.ps1
SET iconPath=%CD%\terminal.ico

powershell -NoProfile -ExecutionPolicy Unrestricted -File "%ps1Path%"  "%iconPath%"
echo quit PowerShell
pause > nul
