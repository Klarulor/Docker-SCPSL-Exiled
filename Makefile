run:
    docker run -d -p 7778:7777/udp -v $PWD/scpsl_config/7778:/config -v $PWD/EXILED/:/exiled  scpsl