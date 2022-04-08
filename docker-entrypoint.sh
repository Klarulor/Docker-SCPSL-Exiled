#!/bin/bash
echo "Hello!"
port=${PORT:-7777}
EXILED_UPDATE=${UPD:false}

#mkdir /scp_server
#mv -n /home/container/Steam/steamapps/common/* /scp_server         
#find  /home/container/Steam/steamapps/common/*/ -maxdepth 1 -type f -exec mv {} /scp_server \;
#sleep 100
cp /home/container/.config/EXILED/Assembly-CSharp.dll /scp_server/SCPSL_Data/Managed/Assembly-CSharp.dll

export DOTNET_BUNDLE_EXTRACT_BASE_DIR="temp"


cd /scp_server
./LocalAdmin $port