#!/bin/bash

if [[ `cat ~/.ctrl_c_handler/ctrl-c-outputs.txt | grep "$1"` != "" ]]; then
   ntfy -t "Scan Result" send "`cat ~/.ctrl_c_handler/ctrl-c-outputs.txt | grep "$1" 2> /dev/null`"
fi
