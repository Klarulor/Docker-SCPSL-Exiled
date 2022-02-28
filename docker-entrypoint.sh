#!/bin/bash

cp /exiled/Assembly-CSharp.dll ./SCPSL_Data/Managed/Assembly-CSharp.dll && \
cp -R "/exiled" "/home/scpsl/.config/EXILED"
sleep 2
echo "Successfully"
sleep 5

# COPY CONFIGS TAGASI

function LoopBackConfigs(){
    sleep 10
    echo "__________Configs loopbacked sucessfully!!!"
    cp -R "/home/scpsl/.config/EXILED/Exiled.Loader.dll" "/exiled"
    cp -R "/home/scpsl/.config/EXILED/Plugins" "/exiled"
    cp -R "/home/scpsl/.config/EXILED/Configs" "/exiled"
    cp -R "/home/scpsl/.config/EXILED/Logs" "/exiled"
}

LoopBackConfigs &
# Start SL
"$INSTALL_LOC/LocalAdmin" 7777

