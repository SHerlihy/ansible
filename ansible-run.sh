#!/usr/bim/env bash

## Install ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y curl git software-properties-common ansible

## Pull my ansible
sudo ansible-pull -U https://github.com/SHerlihy/ansilbe.git
