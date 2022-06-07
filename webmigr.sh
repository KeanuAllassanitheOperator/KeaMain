#!/bin/bash
source $(pwd)/.env
ansible-playbook -i inventorymegabit.yml websitemgr.yml
