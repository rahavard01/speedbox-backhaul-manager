#!/bin/bash

set -e

SCRIPT_URL="https://raw.githubusercontent.com/rahavard01/speedbox-backhaul-manager/main/backhaul.py"

sudo apt update
sudo apt install -y python3 python3-pip python3-venv curl wget unzip tar netcat-openbsd

install_package_if_available() {
    package_name=$(apt search "$1" 2>/dev/null | grep -o "^$1\S*" | head -n 1)
    if [[ -n "$package_name" ]]; then
        sudo apt install -y "$package_name"
    else
        echo "Package $1 not found in the repositories."
    fi
}

install_package_if_available "python3-netifaces"
install_package_if_available "python3-colorama"
install_package_if_available "python3-requests"

python3 -m venv /tmp/speedbox_env
source /tmp/speedbox_env/bin/activate

pip install --upgrade pip
pip install netifaces colorama requests

rm -f backhaul.py
wget -O backhaul.py "$SCRIPT_URL"

python3 backhaul.py

deactivate