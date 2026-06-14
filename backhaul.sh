#!/bin/bash

set -e

SCRIPT_URL="https://raw.githubusercontent.com/rahavard01/speedbox-backhaul-manager/main/backhaul.py"

apt update -y
apt install -y python3 python3-pip wget curl unzip tar netcat-openbsd

rm -f backhaul.py
wget -O backhaul.py "$SCRIPT_URL"

python3 backhaul.py