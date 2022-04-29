#!/bin/bash
sudo apt update -y
sudo apt install ansible -y
sudo ansible-galaxy collection install community.vmware
sudo mkdir ansible-playbooks
