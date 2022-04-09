# Docker-SCPSL-Exiled
Docker image for SCP:SL Dedicated server with EXILED framework

Commands:
  Build:
  ```
  docker build --name scpsl .
  ```
  Run:
  ```
  docker run -p <IP>:7777:7777/udp -e STARTUP="./LocalAdmin 7777" -e REINSTALL=1 -e URL="https://github.com/Exiled-Team/EXILED/releases/download/5.0.0-beta.5/Exiled.Installer-Linux" --network host --name scpsl -v <PATH_TO_FOLDER>:/home/container/.config klarulor/scpsl
  ```
