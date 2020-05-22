#!/bin/bash

# Standard Minecraft
# The data for minecraft server is in an external disk while has daily backups to Storage
sudo mount -o discard,defaults /dev/disk/by-id/google-minecraft-disk /home/minecraft
cd /home/minecraft
exec java -Xms1G -Xmx3G -d64 -jar server.jar nogui
