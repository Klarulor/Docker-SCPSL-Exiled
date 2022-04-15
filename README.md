# Docker-SCPSL-Exiled
Docker image for SCP:SL Dedicated server with EXILED framework

Commands:
  Build:
  ```
  docker build --name scpsl .
  ```
  Run:
  ```
  docker run -p  docker run -p <IP>:127.0.0.1:7777:7777/udp --name scpsl -v <PATH_TO_CONFIG>:/home/container/.config klarulor/scpsl
  ```
| Enviroment variable | Default value | List of values | Description            |
|---------------------|---------------|----------------|------------------------|
| ISNTALL_VANILLA     | "0"           | "0" / "1"      |                        |
| REINSTALL           | "0"           | "0" / "1"      |                        |
| URL                 | <URL>         | <URL>          | Url for install EXILED |
