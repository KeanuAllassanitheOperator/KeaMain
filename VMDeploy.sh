#!/bin/bash
ansible-playbook createwinvm.yml
ansible-playbook poweronvm.yml
ansible-playbook gatheringvms.yml
