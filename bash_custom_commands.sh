#!/bin/bash

# forward any port to testing.ahmedhalat.com which is running my reverse proxy tool vm
# Type in bash terminal "forward 8080" to forward port 8080 to testing.ahmedhalat.com
# This vm is passworded protected and only enabled on use
function forward () {
  ssh -R 8888:localhost:$1 root@testing.ahmedhalat.com
}
