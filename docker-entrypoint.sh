#!/bin/bash

path=${GAME_CONFIG_LOC:-"/home/scpsl/.config/SCP Secret Laboratory/config"}
userPath=${USER_CONFIG_LOC:-"/home/scpsl/.config"}
port=${PORT:-7777}

mkdir -p "/config/$port"
sudo - root
cp $userPath/EXILED/Assembly-CSharp.dll ./SCPSL_Data/Managed/Assembly-CSharp.dll
# cp -R "/exiled" "/home/scpsl/.config/EXILED"
# sleep 2
# echo "Successfully"
# # COPY CONFIGS TAGASI
# echo $port
# function LoopBackConfigs(){
#     echo "__________Configs loopbacked after 20seconds!!!"
#     sleep 20
#     echo "__________Configs loopbacked sucessfully!!!"
#     cp -R "/home/scpsl/.config/EXILED/Exiled.Loader.dll" "/exiled"
#     cp -R "/home/scpsl/.config/EXILED/Plugins" "/exiled"
#     cp -R "/home/scpsl/.config/EXILED/Configs" "/exiled"
#     cp -R "/home/scpsl/.config/EXILED/Logs" "/exiled"
#     # verkey
# }
# LoopBackConfigs &
# # Start SL
# "$INSTALL_LOC/LocalAdmin" port

