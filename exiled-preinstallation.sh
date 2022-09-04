SERVER_PATH="/home/container/scp_server"
EXAMPLE_PATH="/home/container/ExiledExample"

URL="https://github.com/Exiled-Team/EXILED/releases/latest/download/Exiled.Installer-Linux"

echo "Installing EXILED..."
mkdir $EXAMPLE_PATH
wget $URL
chmod +x Exiled.Installer-Linux $EXAMPLE_PATH
./Exiled.Installer-Linux --appdata $EXAMPLE_PATH -p $SERVER_PATH $EXTRA
rm ./Exiled.Installer-Linux 
echo "EXILED successfully installed!"