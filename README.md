# AddTerminalToRight-Click
Add "open Windows terminal here" into right-click context menu

#How to use: run as adminstrator file WtRightClick.bat

#problem solving in this project
1. Interactive with Windows Registry 
=> HKEY_CLASSES_ROOT, in real, it is \HKEY_LOCAL_MACHINE\SOFTWARE\Classes
2. PowerShell cannot get ".ps1" path
=> Create batch file to call .ps1
3. When "Run as administrator" ".bat" file, the starting directory is C:\Windows\System32
=> add 'cd %~dp0' in first row, to run in current directory of file.
