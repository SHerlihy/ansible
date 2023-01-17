FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV ROOT_USR_BIN=/usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y sudo software-properties-common curl git build-essential && \
	apt-add-repository -y ppa:ansible/ansible && \
	apt-get update && \
	apt-get install -y curl git ansible build-essential && \
	apt-get clean autoclean && \
	apt-get autoremove --yes

FROM base AS huge
ARG TAGS
RUN addgroup --gid 1000 thehuge
RUN adduser --disabled-password --gecos thehuge --uid 1000 --gid 1000 --home /home/thehuge --shell /bin/bash thehuge
RUN usermod -aG sudo thehuge

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

ENV USER=thehuge
ENV USER_HOME=/home/thehuge
RUN sudo apt-get update

FROM huge
WORKDIR /home/thehuge
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
