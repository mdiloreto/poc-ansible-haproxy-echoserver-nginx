#!/bin/bash
# Startup script to install Ansible and run a playbook

# Update the package index
sudo apt-get update -y

# Install software-properties-common to manage repositories
sudo apt-get install -y software-properties-common

# Add Ansible PPA and install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible

# Optionally, install Git if you need to clone a playbook repository
sudo apt-get install -y git

# Clone your Ansible playbook repository (replace with your actual repository URL)
git clone https://github.com/yourusername/your-playbook-repo.git /tmp/ansible-playbook

# Navigate to the playbook directory
cd /tmp/ansible-playbook

# Run the Ansible playbook
ansible-playbook your-playbook.yml
