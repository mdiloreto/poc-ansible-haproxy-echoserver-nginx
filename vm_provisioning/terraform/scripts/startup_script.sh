#!/bin/bash

# Log file setup
LOG_FILE="/var/log/startup-script.log"
exec > >(tee -a ${LOG_FILE}) 2>&1
echo "Script started at $(date)"

## Install Ansible + Git 
echo "Installing Ansible and Git..."
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible git
echo "Ansible and Git installed."

## Install Docker 
echo "Installing Docker..."
sudo apt-get update -y 
sudo apt-get install -y ca-certificates curl 
sudo install -m 0755 -d /etc/apt/keyrings 
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc 
sudo chmod a+r /etc/apt/keyrings/docker.asc 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || { echo "Failed to add Docker repository"; exit 1; }
sudo apt-get update -y 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
sudo docker --version && echo "Docker installed successfully." || { echo "Docker installation failed"; exit 1; }

## Create Docker Network 
sudo docker network create app_net
echo "Docker network created."

## Install community.docker
echo "Installing community.docker collection..."
sudo ansible-galaxy collection install community.docker && echo "community.docker installed." || { echo "Failed to install community.docker"; exit 1; }

## Clone repo and execute playbook
echo "Cloning repository and executing playbook..."
git clone https://github.com/mdiloreto/poc-ansible-haproxy-echoserver-nginx /tmp/haproxy-poc || { echo "Failed to clone repository"; exit 1; }
cd /tmp/haproxy-poc/playbooks/ || { echo "Failed to navigate to playbooks directory"; exit 1; }
sudo ansible-playbook deploy.yml && echo "Playbook executed successfully." || { echo "Playbook execution failed"; exit 1; }
sudo touch /tmp/haproxy-poc/startup_finished.txt
echo "Script finished at $(date)"
