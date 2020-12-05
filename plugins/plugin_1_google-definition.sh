#!/bin/bash

words="`cat ~/.ctrl_c_handler/ctrl-c-outputs.txt`"
google-chrome "https://www.google.com/search?q=$words" > /dev/null
