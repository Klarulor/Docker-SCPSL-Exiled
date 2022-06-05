SERVER_PATH="/home/container/scp_server/"
CONFIG_PATH="/home/container/.config/"
DATA_PATH="home/container/data"




echo "Installing EXILED..."
wget $reinstall
chmod +x Exiled.Installer-Linux
./Exiled.Installer-Linux --appdata $CONFIG_PATH -p $SERVER_PATH $EXTRA
rm ./Exiled.Installer-Linux 