#!/usr/bin/env bash

apt install -y apt-add-repository
apt install software-properties-common
apt-get update -y

apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible

## Pull my ansible
ansible-pull -U https://github.com/SHerlihy/ansible
