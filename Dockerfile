FROM ubuntu:16.04
COPY sources.list /etc/apt/sources.list
RUN apt update && \
  apt install python3 python3-pip wget vim openssh-server curl dnsutils -y && \
  apt clean autoclean && \
  apt autoremove --yes

RUN pip3 install awscli --upgrade
