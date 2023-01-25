FROM ubuntu:focal AS base
ENV HOME=/
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /usr/local/bin
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y vim software-properties-common curl git build-essential && \
	apt-add-repository -y ppa:ansible/ansible && \
	apt-get update && \
	apt-get install -y curl git ansible build-essential

FROM base AS extras
RUN apt-get install -y sudo stow && \
	apt-get update

FROM extras AS clean
RUN apt-get clean autoclean && \
	apt-get autoremove --yes

FROM clean AS users
RUN addgroup --gid 1000 thehuge
RUN adduser --disabled-password --gecos thehuge --uid 1000 --gid 1000 --home /home/thehuge thehuge
RUN usermod -aG sudo thehuge
RUN sudo apt-get update

ENV USER_HOME=/home/thehuge

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

FROM users
ENV USER=root
WORKDIR /home/thehuge
COPY . .
ARG TAGS
CMD sudo ansible-playbook $TAGS local.yml
