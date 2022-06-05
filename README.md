# Docker-SCPSL-Exiled
Docker image for SCP:SL Dedicated server with EXILED framework

Commands:
  Build:
  ```
  docker build --name scpsl .
  ```
  Run:
  ```
  docker run -p  docker run -p <IP>:127.0.0.1:7777:7777/udp --name scpsl -e PORT=7777 -v <PATH_TO_CONFIG>:/home/container/data klarulor/scpsl
  ```
| Enviroment variable | Default value | List of values | Description            |
|---------------------|---------------|----------------|------------------------|
| PORT                | 7777          | *SERVER PORT*  |                        |
| VANILLA             | 0             | 0 / 1          | Run vanilla server     |
| REINSATLL_EXILED    | 0             | *URL*          | Url for install EXILED |

*Some files were taken from https://github.com/Exiled-Team/pterodactyl*