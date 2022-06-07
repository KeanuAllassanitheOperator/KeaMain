#!/bin/bash
source $(pwd)/.env
ansible-playbook -i inventory.megabit.net cleanmigr.yml
