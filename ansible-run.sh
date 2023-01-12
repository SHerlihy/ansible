#!/usr/bin/env bash
apt-add-repository -y ppa:ansible/ansible
apt-get update -y
apt-get install -y curl software-properties-common ansible

## Pull my ansible
ansible-pull -U https://github.com/SHerlihy/ansible
