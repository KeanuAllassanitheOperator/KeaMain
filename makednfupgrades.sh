#!/bin/bash
sudo dnf upgrade --refresh
sudo dnf needs-restarting -r
if [ $? -ne 0 ]; then
  echo "Reboot required after updates. Please reboot the system." >> /var/log/dnf.log
  sudo reboot
else
  echo "No reboot required after updates." >> /var/log/dnf.log
fi
