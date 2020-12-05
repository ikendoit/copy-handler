import time
import sys
import os
import pyperclip

recent_value = ""
while True:
    tmp_value = pyperclip.paste()
    if tmp_value != recent_value:
        recent_value = tmp_value
        open(os.path.expanduser('~/.ctrl_c_handler/ctrl-c-outputs.txt'), 'w+').write(tmp_value)
    time.sleep(1)
