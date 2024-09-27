$installDir = "C:\Users\$Env:UserName\Steam"
New-Item -ItemType Directory -Path $installDir -Force

$setupFile = "SteamSetup.exe"
Invoke-RestMethod "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" -OutFile $setupFile

cmd.exe /c "set __COMPAT_LAYER=RUNASINVOKER && start $setupFile /S /D=$installDir"

$steamExe = "$installDir\Steam.exe"
while (-not (Test-Path $steamExe)) {
    Write-Host "Waiting for Steam.exe..."
    Start-Sleep -Seconds 1
}

Write-Host "Installing steam..."
$download = cmd.exe /c "$steamExe"
Write-Host $download

if (Test-Path $setupFile) {
    Remove-Item $setupFile -Force
    Write-Host "Steam setup file deleted."
} else {
    Write-Host "Steam setup file not found for deletion."
}

$WshShell = New-Object -COMObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Env:UserName\Desktop\Steam.lnk")
$Shortcut.TargetPath = "$steamExe"
$Shortcut.Save()

Write-Host "Steam setup is complete!"
