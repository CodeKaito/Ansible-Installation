#!/bin/bash

# Function to detect package manager and install dependencies
install_dependencies() {
    if command -v dnf &>/dev/null; then
        sudo dnf update -y
        # Install EPEL release if on RHEL/CentOS/Rocky
        if [[ -f /etc/redhat-release ]]; then
            sudo dnf install -y epel-release
        fi
        sudo dnf install -y python3 python3-pip ansible

    elif command -v yum &>/dev/null; then
        sudo yum update -y
        # Install EPEL release for CentOS/RHEL 7 and similar
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install -y epel-release
        fi
        sudo yum install -y python3 python3-pip ansible

    elif command -v apt &>/dev/null; then
        sudo apt update -y
        sudo apt install -y python3 python3-pip ansible

    else
        echo "Unsupported package manager. Please install Python3, pip, and Ansible manually."
        exit 1
    fi
}

# Install dependencies
install_dependencies

# Verify installation
python3 --version
ansible --version

echo "Installation completed successfully!"
