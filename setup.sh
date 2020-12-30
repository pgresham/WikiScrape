#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo "Run it as Root!"
    exit 0
fi

echo "Installing Dependencies"

apt-get install python3-pip
pip3 install beautifulsoup4
pip3 install requests

echo "chmod +x ..."
chmod +x wikiscrape
echo "type ./wikiscrape to run"
exit 0
