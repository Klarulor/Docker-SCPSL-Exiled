cd /home/container || exit
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo "/home/container/scp_server$: ${port} ${MODIFIED_STARTUP}"


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
    ./steamcmd.sh +force_install_dir /scp_server +login anonymous +app_update 996560 validate $EX +quit
#        cp -r ~/Steam/steamapps/common/SCP*/* ~/scp_server



chmod -R 777 /home/container/.config
chmod -R 777 /home/container/.config/