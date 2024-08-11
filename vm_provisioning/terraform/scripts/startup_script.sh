#!/bin/bash
## Install Ansible + Git 
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible
sudo apt-get install -y git

## Install Docker 
sudo apt-get update -y 
sudo apt-get install -y ca-certificates curl 
sudo install -m 0755 -d /etc/apt/keyrings 
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc 
sudo chmod a+r /etc/apt/keyrings/docker.asc 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keydockerrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || { echo "Failed to add Docker repository"; exit 1; }
sudo apt-get update -y 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
sudo apt-get update
sudo apt-get install docker-compose-plugin -y
sudo docker --version
sudo docker network create app_net

## Install community.docker

sudo ansible-galaxy collection install community.docker

## Clone repo and execute playbook

git clone https://github.com/mdiloreto/poc-ansible-haproxy-echoserver-nginx /tmp/haproxy-poc
cd /tmp/haproxy-poc/playbooks/
sudo ansible-playbook deploy.yml
