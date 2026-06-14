#!/bin/bash

set -e

apt update -y
apt install -y python3 python3-pip curl wget unzip tar netcat-openbsd

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -f "$SCRIPT_DIR/backhaul.py" ]; then
    echo "Error: backhaul.py not found in $SCRIPT_DIR"
    exit 1
fi

python3 "$SCRIPT_DIR/backhaul.py"