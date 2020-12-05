#!/bin/bash

echo "please have python3"
echo "please have pip"
echo "please have fswatch using: https://github.com/emcrisostomo/fswatch#getting-fswatch"
echo "please read error message and see what you are missing, install those too :)"

# Excuse my lack of containers
mkdir ~/.ctrl_c_handler 2> /dev/null
echo "" > ~/.ctrl_c_handler/ctrl-c-outputs.txt

# check if CTRL_C_HOME_DIRECTORy
if [[ $COPY_HANDLER_HOME_DIRECTORY = ''  ]]; then
  echo "export COPY_HANDLER_HOME_DIRECTORY=$PWD;" >> ~/.bash_profile;
else
  echo "Already set up with bash_profile config."
fi

# Set up simplink in /usr/bin/ directory
sudo rm /usr/bin/copy-handler 2> /dev/null
sudo ln -s $PWD/copy-handler.sh /usr/bin/copy-handler

# Install platform-agnostic dependencies
sudo pip3 install ntfy
sudo pip3 install pyperclip
