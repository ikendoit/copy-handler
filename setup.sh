#!/bin/bash

echo "please have python3"
echo "please have pip"
echo "please have fswatch using: https://github.com/emcrisostomo/fswatch#getting-fswatch"
echo "please read error message and see what you are missing, install those too :)"

# Excuse my lack of containers
mkdir ~/.ctrl_c_handler 2> /dev/null
echo "" > ~/.ctrl_c_handler/ctrl-c-outputs.txt
sudo pip3 install googlemaps
sudo pip3 install google-cloud-translate==2.0.1
sudo pip3 install ntfy
sudo pip3 install pyperclip
