# :fist_raised: Copy Handler 

:fairy: Hello 
:fairy: I am Fairie
:fairy: Nice to meet you
:fairy: Bye


## Copy handler is a program that captures host machine's ctrl+c, and automatically executes asynchronous tasks for you quickly.

## :haircut: Usage:

### One time set up: 
```
  bash setup.sh
```

### Main Usage:
```
  echo "doing your thing..."
  ...
  copy-handler.sh <mode> <config>
  # Terminate by pressing ctrl-c, so the worker's final task is to die.
  ...
  echo "back to doing your thing..."
```

#### Mode:
  - `grep "<text-pattern>"`: Ccan the copied text, notify if text contains pattern
  - `definition`: Google Search this text 
  - `translate`: Google Translate this text 
  - `youtube`: Google Youtube Search this text

## :building_construction: Plugins system

```
  cd ./plugins
  # view sample files, create one yourself
  # remember the naming prefix "plugin_", without it, the plugin would not run.
```

