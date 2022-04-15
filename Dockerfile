FROM ubuntu:20.04
MAINTAINER joker119
USER root
RUN echo "Building.."

RUN apt update && \
    apt upgrade -y
RUN apt install -y wget curl
#
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \ 
    dpkg -i packages-microsoft-prod.deb && \
    chmod 777 /packages-microsoft-prod.deb && \
    dpkg --install /packages-microsoft-prod.deb &&\
    apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-6.0 && \
    apt-get update &&\
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y aspnetcore-runtime-6.0

#        Instead ->
#RUN apt-get update && apt-get install -y gnupg2
#RUN apt-get purge libmono* cli-common mono-runtime
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#RUN apt-get update
#RUN apt-get install apt-transport-https ca-certificates software-properties-common wget curl -y
#RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list
#RUN apt-get update
#RUN apt-get install -y mono-complete
#        This -> 
RUN apt update && \
    apt install -y dirmngr gnupg apt-transport-https ca-certificates software-properties-common && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF   && \
    apt-add-repository 'deb https://download.mono-project.com/repo/ubuntu stable-focal main' && \
    apt install -y mono-complete



RUN add-apt-repository multiverse
RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install lib32gcc1 nodejs -y
RUN adduser --home /home/container container --disabled-password --gecos "" --uid 999
RUN usermod -a -G container container
RUN mkdir /home/container/.config
RUN chown -R container:container /home/container
RUN mkdir /mnt/server
RUN chown -R container:container /mnt/server
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./preinstallation.sh /home/container/preinstallation.sh
RUN /home/container/preinstallation.sh && \
    rm /home/container/preinstallation.sh

ENV CACHEBUST=1
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]