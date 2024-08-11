#!/bin/bash
## Install Ansible + Git 
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible
sudo apt-get install -y git

## Install Docker 
#!/bin/bash
# Enable logging
exec > /var/log/startup-script.log 2>&1
sudo apt-get update -y || { echo "Failed to update package list"; exit 1; }
sudo apt-get install -y ca-certificates curl || { echo "Failed to install required packages"; exit 1; }
sudo install -m 0755 -d /etc/apt/keyrings || { echo "Failed to create keyrings directory"; exit 1; }
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc || { echo "Failed to download Docker GPG key"; exit 1; }
sudo chmod a+r /etc/apt/keyrings/docker.asc || { echo "Failed to set permissions on Docker GPG key"; exit 1; }
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || { echo "Failed to add Docker repository"; exit 1; }
sudo apt-get update -y || { echo "Failed to update package list after adding Docker repository"; exit 1; }
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || { echo "Failed to install Docker"; exit 1; }
sudo apt-get update
sudo apt-get install docker-compose-plugin
sudo docker --version || { echo "Docker installation verification failed"; exit 1; }
docker network create app_net

git clone https://github.com/mdiloreto/poc-ansible-haproxy-echoserver-nginx /tmp/haproxy-poc

cd /tmp/haproxy-poc/playbooks/

ansible-playbook deploy.yml
