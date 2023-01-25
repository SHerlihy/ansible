#!/usr/bin/env bash
su root
cd /usr/local/bin
apt-get update
apt-get upgrade -y
apt-get install -y curl software-properties-common ansible git build-essential

apt-add-repository -y ppa:ansible/ansible
apt-get update -y

## Pull my ansible
ansible-pull -U https://github.com/SHerlihy/ansible.git
