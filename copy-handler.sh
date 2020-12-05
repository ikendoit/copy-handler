#!/bin/bash

trap 'echo killing all children; kill 0' EXIT # kill parallel processes

export CTRL_C_HANDLER_PLUGIN_PATTERN=$1
export CTRL_C_HANDLER_ARGUMENT=$2
echo "`date +%s`" > ~/.ctrl_c_handler/last_run_time


#1. spins up listener to grab new clipboard value
#2. Determine the python modules we should use
#3. Run fswatch to watch file copy-handler-c-output.txt
#4. On every file change, run those modules with $2 param as argument

python3 $COPY_HANDLER_HOME_DIRECTORY/clipboard-listener.py &

function runPlugins()
{
  last_run_stamp=`cat ~/.ctrl_c_handler/last_run_time`
  run_stamp=`date +%s`

  # validate if last invocation was less than 2 seconds ago, if yes, don't run, could be the fswatch bug ( fswatch shoots multiple records per file-event )
  if [ "$(expr $run_stamp - $last_run_stamp)" -ge 2 ]; then

    for plugin_file in `ls -d $COPY_HANDLER_HOME_DIRECTORY/plugins/* | grep "plugin_" | grep "$CTRL_C_HANDLER_PLUGIN_PATTERN"`; do

      $plugin_file $CTRL_C_HANDLER_ARGUMENT

    done;

    echo "`date +%s`" > ~/.ctrl_c_handler/last_run_time
  fi

}
export -f runPlugins

# listen to file change to update
fswatch -0 --event Updated ~/.ctrl_c_handler/ctrl-c-outputs.txt | xargs -0 -n 1 bash -c 'runPlugins'
