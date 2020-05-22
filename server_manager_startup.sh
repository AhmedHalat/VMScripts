#!/bin/bash

# Standard ServerManager
cd /home/server            
sudo gsutil -m cp  gs://fileuploader-13/ServerManager.js /home/server
export GOOGLE_APPLICATION_CREDENTIALS="/home/server/Servers-432f295fec07.json"
exec node ServerManager.js                
