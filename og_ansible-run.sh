#!/usr/bin/env bash
apt upgrade && apt update

apt install -y git
apt install -y software-properties-common
apt update

apt-add-repository --yes ppa:ansible/ansible
pat-get update -y
apt install -y ansible

## Pull my ansible
ansible-pull -U https://github.com/SHerlihy/ansible
