run:
    docker run -d -p 7777:7777/udp -e PORT=7777 -v $PWD/scpsl:/home/scpsl/.config klarulor/scpsl