# Docker-SCPSL-Exiled
Docker image for SCP:SL Dedicated server with EXILED framework

Commands:
  Build:
  ```
  docker build --name scpsl .
  ```
  Run:
  ```
  docker run -d -p <PORT>:<PORT>/udp -e PORT=<PORT> -v $PWD/scpsl_config:/config -v $PWD/EXILED/:/exiled  scpsl
  ```
