cd /home/container || exit
echo "Installing steamcmd"
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
echo "Installing SCP:SL"
./steamcmd.sh +force_install_dir ./scp_server +login anonymous +app_update 996560 validate $EX +quit
echo "SCPSL Successfully installed"