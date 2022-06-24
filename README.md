# Docker-SCPSL-Exiled
Docker image for SCP:SL Dedicated server with EXILED framework

Commands:
  **Build:**

    Build normal version for x86 
    ```
    make run 
    ```
    Build version for ARM 
    ```
    make arm
    ```
    Run:
    ```
    docker run -p <IP>:7777:7777/udp --name scpsl -e PORT=7777 -v <PATH_TO_CONFIG>:/home/container/.config klarulor/scpsl
    ```
| Enviroment variable | Default value | List of values | Description            |
|---------------------|---------------|----------------|------------------------|
| PORT                | 7777          | *SERVER PORT*  |                        |
| VANILLA             | 0             | 0 / 1          | Run vanilla server     |
| REINSATLL_EXILED    | 0             | *URL*          | Url for install EXILED |

*Some files were taken from https://github.com/Exiled-Team/pterodactyl*