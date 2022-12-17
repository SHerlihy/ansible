#!/usr/bim/env bash

## Install ansible
apt-add-repository -y ppa:ansible/ansible
apt-get update -y
apt-get install -y curl git software-properties-common ansible

## Pull my ansible
ansible-pull -U https://github.com/SHerlihy/ansible
