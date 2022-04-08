run:
    docker run -d -p 7777:7777/udp -e PORT=7777 -v $PWD/scpsl:/home/scpsl/.config klarulor/scpsl
linux:
    docker run -d -p 10.8.0.4:7777:7777/udp -e PORT=7777 -v /var/scpsl:/home/scpsl/.config klarulor/scpsl