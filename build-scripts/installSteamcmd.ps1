$steamcmdPath="${PWD}/temp"
echo "Checking SteamCmd if exists at ${steamcmdPath}"
if (-not(Test-Path -Path "${steamcmdPath}/steamcmd.exe" -PathType Leaf)) {
    echo "Installing SteamCmd..."
    try{
        Invoke-WebRequest -Uri "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" -OutFile "${steamcmdPath}/steamcmd.zip"

        Expand-Archive "${steamcmdPath}/steamcmd.zip" -DestinationPath "${steamcmdPath}/"
    }catch{}
    
    echo "SteamCmd successfully installed"
 }else {
    echo "SteamCmd exists, skipping"
}
