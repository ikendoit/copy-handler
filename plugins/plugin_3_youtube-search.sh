#!/bin/bash

words="`cat ~/.ctrl_c_handler/ctrl-c-outputs.txt`"
google-chrome "https://www.youtube.com/results?search_query=$words" > /dev/null

