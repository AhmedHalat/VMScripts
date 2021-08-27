#!/bin/bash

# ===== Setup =====
# 1. Create file and Paste commands here:
#   ~/.my_custom_commands.sh
# 2. Give access to this file:
#   chmod +x .my_custom_commands.sh
# 3. Edit bashrc in root file and add line:
#   source ~/.my_custom_commands.sh


# forward any port to XXXXXX.com which is running my reverse proxy tool vm
# Type in bash terminal "forward 8080" to forward port 8080 to XXXXXX.com
# This vm is passworded protected and only enabled on use
function forward () {
  ssh -R 8888:localhost:$1 root@XXXXXX.com
}

# Applies spotify themes using spicetify
# The themes must be installed first, check out spicetify community themes repo
# can apply a theme or a color_scheme
function spotify_style(){
  if [[ "$#" = 1 ]]; then
    spicetify config current_theme $1
  elif [[ "$#" = 2 ]]; then
    spicetify config current_theme $1 color_scheme $2
  else
    echo "Wrong number of arguments. 1- Theme, 2- Color scheme"
    return;
  fi
  YES | spicetify apply # Kind of unsafe, since it just applies through warnings
}


# kill processes running in local by name
# $1, name of process to kill
function processKill(){
  lsof=`lsof -iTCP -sTCP:LISTEN -P| grep "$1[[:blank:]]" -m 1 `
  pid=$(echo $lsof | awk '{print $2}')
  name=$(echo $lsof | awk '{print $9}')

  if [ ! -z "$pid" ]; then
    printf "\e[32mKilling Process \"$1\" PID:$pid at $name \e[m\n"
    kill -9 $pid
  else
    printf "\e[31mProcess \"$1\" not found running in local\e[m\n"
  fi
}
