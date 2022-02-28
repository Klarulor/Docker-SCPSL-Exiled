# Docker-SCPSL-Exiled
Docker image for SCP:SL Dedicated server with EXILED framework

Commands:
  Build:
  ```
  docker build --name scpsl .
  ```
  Run:
  ```
  docker run -d -p <PORT>:7777/udp -v <PATH>/scpsl_config/<PORT>:/config -v <PATH>/EXILED/:/exiled  scpsl
  ```
