$installDir = "C:\Users\$Env:UserName\steam"
New-Item -ItemType Directory -Path $installDir -Force

Invoke-RestMethod "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe" -OutFile "steam.exe"

cmd.exe /c "set __COMPAT_LAYER=RUNASINVOKER && start steam.exe --install-path=$installDir"
