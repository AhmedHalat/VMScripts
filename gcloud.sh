#!/usr/bin/env bash

# For this to work, google-cloud-sdk must be installed
#   on terminal and signed-in
#
# There are 2 different Input modes
# 1 input, VM toggle mode
# 2 input, Start, stop, restart specified


# TOGGLE MODE:
#   Only 1 Argument: Instance Name

if [[ "$#" = 1 ]]; then
  info=`gcloud compute instances list | grep "$1[[:blank:]]"`
  if [[ "$1" = 1 ]]; then
    printf "\e[31mIt seems this instance doesn't exist\e[m\n"
    exit 1
  else
    case $info in
      *TERMINATED )
        printf "\e[32m$1 is TERMINATED... Starting now\e[m\n"
        gcloud compute instances start $1
      ;;
      *)
        printf "\e[32m$1 is RUNNING... Stopping now\e[m\n"
        gcloud compute instances stop $1
      ;;
    esac
  fi
fi
