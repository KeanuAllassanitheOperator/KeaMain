#!/bin/bash
ansible-playbook -i inventory.yml installad.yml -vvv
ansible-playbook -i inventory.yml configuread.yml -vvv
#ansible-playbook -i inventory.yml installcert.yml -vvv
#ansible-playbook -i inventory.yml renamehost.yml -vvv
