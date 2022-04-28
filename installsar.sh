#!/bin/bash
#Sar ist ein Linux Command Utility, um die Performance eines Linux-Hosts zu testen https://www.howtogeek.com/793513/how-to-use-the-sar-command-on-linux/
sudo apt install sysstat
sudo systemctl enable sysstat
sudo systemctl start sysstat
sar -V
