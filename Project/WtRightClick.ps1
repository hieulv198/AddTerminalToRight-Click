#echo $args[0]
#$iconPathSource = $args[0]
$iconPathSource = 'C:\Users\NTQ\OneDrive\Documents\#KEEP\WtRightClick\terminal.ico'


$wtApp = Get-AppxPackage | ? {$_.name -like '*Microsoft.WindowsTerminal*'}
$wtApp
if ($wtApp -eq $null)
{
    Echo 'Microsoft.WindowsTerminal was not installed.'
    exit
}

#.Remove Existed HKLM
$keyWtPath = 'HKLM:\SOFTWARE\Classes\Directory\background\shell\wt'
if (Test-Path -Path $keyWtPath)
{
    Remove-Item -Path $keyWtPath -ErrorAction SilentlyContinue
}


#.Create HKLM (Command)
$installLocation = $wtApp.InstallLocation
New-item -Path $keyWtPath -Value 'Open Windows Terminal here'
New-item -Path $keyWtPath\command -Value $installLocation\wt.exe


#.Create HKLM Icon
$iconDir = $env:LOCALAPPDATA + '\WTerminal'
$iconPath = $iconDir+'\terminal.ico'

if( -Not (Test-Path $iconDir))
{
    New-Item -ItemType Directory $iconDir
}

Copy-Item  $iconPathSource -Destination $iconPath -Force

New-ItemProperty -Path $keyWtPath -Name Icon -Value $iconPath
echo iconPathSource: $iconPathSource
echo iconPathDest: $iconPath