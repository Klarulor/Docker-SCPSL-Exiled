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





echo "Installing SCP:SL..."
$scpPath="${PWD}/temp_scp"
$steamcmdFile="${PWD}/temp/steamcmd.exe"
echo "Checking SCP:SL if exists"
if (Test-Path -Path $scpPath) {
    "echo SCP:SL exists, deleting..."
    Remove-Item -Path ${scpPath} -Force -Recurse
}
mkdir ${scpPath}
echo "Invoking SteamCMD"
.\temp\steamcmd.exe +force_install_dir ${scpPath} +login anonymous +app_update 996560 validate $EX +quit +@sSteamCmdForcePlatformType linux +@sSteamCmdForcePlatformBitness 64