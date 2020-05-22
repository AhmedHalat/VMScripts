# VMScripts
This repo is used as a backup for my GCP VM startup scripts

## Running
Store all the scripts in /root/

Add the startup script Custom metadata to the GCP vm as: 

**Key**: startup-script	
**Value**: /root/start_server.bash

### Testing script

Test to see if GCP startup script added properly with 

```sudo google_metadata_script_runner --script-type startup --debug```
