SERVER_PATH="/home/container/scp_server/"
CONFIG_PATH="/home/container/.config/"

URL="https://github.com/Exiled-Team/EXILED/releases/download/5.2.1/Exiled.Installer-Linux"

echo "Installing EXILED..."
wget $URL
chmod +x Exiled.Installer-Linux
./Exiled.Installer-Linux --appdata $CONFIG_PATH -p $SERVER_PATH $EXTRA
rm ./Exiled.Installer-Linux 