run:
    docker run -d -p 7777:7777/udp -e PORT=7777 -v $PWD/scpsl_config:/config -v $PWD/EXILED/:/exiled  scpsl