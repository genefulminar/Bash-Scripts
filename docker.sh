#!/bin/bash

# Install prerequisites
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/$(awk -F'=' '/^ID=/{ print $NF }' /etc/os-release)/gpg | sudo apt-key add -

# Add Docker software repository
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(awk -F'=' '/^ID=/{ print $NF }' /etc/os-release) $(lsb_release -cs) stable"

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-compose containerd.io

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Reauthenticate for the new group membership to take effect
su - $USER
