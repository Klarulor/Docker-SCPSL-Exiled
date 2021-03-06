server_port=${PORT:-7777}
modded=${VANILLA:-1}
reinstall=${REINSATLL_EXILED:-0}

SERVER_PATH="/home/container/scp_server/"
CONFIG_PATH="/home/container/.config"
EXAMPLE_PATH="/home/container/ExiledExample"



reinstallExiled(){
    echo "Reinstalling EXILED..."
    wget $reinstall
    chmod +x Exiled.Installer-Linux

    ./Exiled.Installer-Linux --appdata $CONFIG_PATH -p $SERVER_PATH $EXTRA
    rm ./Exiled.Installer-Linux 
}


reinstallServer(){
    cd /home/container || exit
    echo "Reinstalling steamcmd"
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
    echo "Installing SCP:SL"
    ./steamcmd.sh +force_install_dir ./scp_server +login anonymous +app_update 996560 validate $EX +quit
    echo "SCPSL Successfully installed"
}

if [ $reinstall != 0 ] && [ $modded == 1 ]; then 
    reinstallExiled
fi
if [ $modded == 0 ]; then
    reinstallServer
fi
if [ ! -f $CONFIG_PATH/EXILED ]; then
    cp -r $EXAMPLE_PATH/. $CONFIG_PATH/
fi;

# Startup server
export DOTNET_BUNDLE_EXTRACT_BASE_DIR="temp"
echo "Stating server at $server_port port.."
cd $SERVER_PATH
./LocalAdmin $server_port