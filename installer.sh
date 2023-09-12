#!/bin/bash

# Triggers if the script did not run as superuser
if ! [[ "$EUID" = 0 ]]; then
  echo "You need to run the code as superuser. Don't worry, everything that it is doing is well documented. :)"
  exit 1
fi

# Gets script path
SCRIPT_PATH="$(dirname "$0")/automatically_mount_partition.sh"

# Gets ".service" file path
SERVICE_FILE_PATH="/etc/systemd/system/automatically_mount_partition.service"

# Triggers if the ".service" file does not exists
if ! test -f "$SERVICE_FILE_PATH"; then
  touch "$SERVICE_FILE_PATH"
fi

# Clears the content of the ".service" file
sudo truncate -s 0 "$SERVICE_FILE_PATH"

# Adds the data to the ".service" file
sudo printf "[Unit]\nDescription=Automatically mount HDD partition from boot\n\n[Service]\nExecStart=$SCRIPT_PATH\nRestart=always\nUser=root\n\n[Install]\nWantedBy=default.target" >> "$SERVICE_FILE_PATH"

# Enables the ".service" file
sudo systemctl enable automatically_mount_partition.service

# Starts the ".service" file
sudo systemctl start automatically_mount_partition.service

echo "All done, now you just need to reboot your system in order to apply the changes made."