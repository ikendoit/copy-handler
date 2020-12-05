#!/bin/bash

words="`cat ~/.ctrl_c_handler/ctrl-c-outputs.txt`"
google-chrome "https://translate.google.com/?ui=tob&sl=auto&tl=en&text=$words&op=translate" > /dev/null
