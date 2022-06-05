#!/bin/bash
echo "Hello!"
cd /home/container || exit
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP:-"./LocalAdmin 7777"}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
REINSTALL_ENV="${REINSTALL:-"0"}"
USE_OWN="${OWN:-"0"}"
download_url="${URL:-"https://github.com/Exiled-Team/EXILED/releases/download/5.1.3/Exiled.Installer-Linux"}"
echo "/home/container/scp_server$: ${MODIFIED_STARTUP}"
INSTALL_VANILLA="${VANILLA:-"0"}"
if [ $REINSTALL_ENV != "0" ] && [ ! -f ./scp_server/LocalAdmin ]; then
        if [ ! -f "steamcmd.sh" ]; then
            curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
        fi
        if [ ! -d "steamcmd" ]; then
            curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
        fi
        EX=""
        if [ ! -z $SPECIAL_BRANCH ]; then
                EX="-beta $SPECIAL_BRANCH"
                if  [ ! -z $BRANCH_PASSWORD ]; then
                        EX="-beta $SPECIAL_BRANCH -betapassword $BRANCH_PASSWORD"
                fi
        fi
        echo $EX
        ./steamcmd.sh +force_install_dir ./scp_server +login anonymous +app_update 996560 validate $EX +quit
#        cp -r ~/Steam/steamapps/common/SCP*/* ~/scp_server
fi


echo "Updating Installer.."
if  [ ! -f "/home/container/__var_exiled_installed" ] && [ $INSTALL_VANILLA == "0" ]  && [ $USE_OWN == "0" ]; then # ! -f "/home/container/.config/EXILED/Assembly-CSharp.dll"
echo "----------------------------------------------- INSTALLING EXIELD"
        rm -rf Exiled.Installer-Linux
        wget $download_url
        chmod +x Exiled.Installer-Linux
        
fi

echo "Installer updated. Running.."
echo "we-1"
EXTRA=""
if [ "$PRE_RELEASE" == 1 ]; then
        EXTRA="--pre-releases"
fi
if [ ! -z "$EXILED_VER" ]; then
        EXTRA="--target-version $EXILED_VER"
fi
echo "we-2"

rm -rf "temp" &&
mkdir "temp" &&
export DOTNET_BUNDLE_EXTRACT_BASE_DIR="temp"
echo "we-3"

if [ ! -d "/home/container/.config" ]; then
  mkdir .config
fi
echo "we-4"
if  [ ! -f "/home/container/__var_exiled_installed" ] && [ $INSTALL_VANILLA == "0" ] && [ $USE_OWN == "0" ]; then
        ./Exiled.Installer-Linux --appdata /home/container/.config -p /home/container/scp_server $EXTRA
        touch "/home/container/__var_exiled_installed" 
fi
echo "we-5"

if [ -f "/home/container/.config/EXILED/Plugins/DiscordIntegration.dll" ]; then
        cd DiscordIntegration &&
        if [ ! -d "/home/container/DiscordIntegration/node_modules" ]; then
                npm install package.json
        fi

        node discordIntegration.js > /home/container/DiscordIntegration/logs/latest.log &
        cd /home/container || exit
fi
echo "we-6"
echo ${MODIFIED_STARTUP}

#[ -f "/home/container/scp_server/SCPSL_Data/Managed/Assembly-CSharp.dll" ] && cp "/home/container/scp_server/SCPSL_Data/Managed/Assembly-CSharp.dll" "/home/container/.config/EXILED/Assembly-CSharp.dll"
if [ $USE_OWN == "0" ]; then
        cp "/home/container/.config/EXILED/Assembly-CSharp.dll" "/home/container/scp_server/SCPSL_Data/Managed/Assembly-CSharp.dll"
fi


#touch /_installed

cd /home/container/scp_server &&
${MODIFIED_STARTUP};


echo "we-7"
