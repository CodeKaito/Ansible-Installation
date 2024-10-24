#!/bin/bash

# Update the system package index
sudo dnf update -y

# Install Python3 and Python3-pip
sudo dnf install -y python3 python3-pip

# Install Ansible using pip
pip3 install --user ansible

# Verify installation
python3 --version
ansible --version

echo "Installation completed successfully!"
