$installDir = "C:\Users\$Env:UserName\Steam"
New-Item -ItemType Directory -Path $installDir -Force

Invoke-RestMethod "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" -OutFile "Steam.exe"

cmd.exe /c "set __COMPAT_LAYER=RUNASINVOKER && start Steam /S /D=$installDir"
cmd.exe /c "$installDir\Steam\Steam"
