#!/usr/bin/env bash
set -x # debugging on
set -e # exit if command exits with non-zero status

# Working Directory
working_dir=$(pwd)

## Ansible
# Setup Ansible
#sudo apt-get update # need to update on first run
#sudo apt-get install -y git python-pip python-dev python-cffi libssl-dev debconf-utils libaio1 aptitude
#sudo -H pip install --upgrade pip
#sudo -H pip install ansible

# as much as I love cowsay, lets turn it off so Ansible's messages aren't cows
export ANSIBLE_NOCOWS=1

# Clone the Durban 2018 github repo
#git clone https://github.com/SophieS9/durban_2018.git

# hoping this helps with mysql install issues!
export DEBIAN_FRONTEND=noninteractive

# run the base playbook
ansible-playbook /home/ubuntu/durban_2018/base/main.yaml -b -K -c local -i "localhost,"

# turn off
set +x
set +e
