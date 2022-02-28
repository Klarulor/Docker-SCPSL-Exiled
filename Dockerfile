FROM steamcmd/steamcmd AS steambuild

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget

ARG APPID=996560
ARG STEAM_BETA

# Make our config and give it to the steam user
USER root

# Install the scpsl server
RUN mkdir -p /scpserver && \
    steamcmd \
        +login anonymous \
        +force_install_dir /scpserver \
        +app_update $APPID $STEAM_BETA validate \
        +quit

FROM mono AS runner

ARG PORT=7777
ARG UID=999
ARG GID=999

ENV CONFIG_LOC="/config"
ENV INSTALL_LOC="/scpserver"
ENV GAME_CONFIG_LOC="/home/scpsl/.config/SCP Secret Laboratory/config"

USER root

# Setup directory structure and permissions
RUN groupadd -g $GID scpsl && \
    useradd -m -s /bin/false -u $UID -g scpsl scpsl && \
    mkdir -p "$GAME_CONFIG_LOC" $CONFIG_LOC $INSTALL_LOC && \
    ln -s $CONFIG_LOC "$GAME_CONFIG_LOC/$PORT" && \
    chown -R scpsl:scpsl $INSTALL_LOC $CONFIG_LOC /home/scpsl/.config
COPY --chown=scpsl:scpsl --from=steambuild /scpserver $INSTALL_LOC
COPY docker-entrypoint.sh /docker-entrypoint.sh

# EXILED SETUP

# I/O
VOLUME [ $CONFIG_LOC ]
VOLUME [ "/exiled" ]
EXPOSE $PORT/udp

# Expose and run
USER scpsl
WORKDIR $INSTALL_LOC
ENTRYPOINT /docker-entrypoint.sh