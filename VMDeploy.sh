#!/bin/bash
ansible-playbook createvm.yml
ansible-playbook poweronvm.yml
ansible-playbook gathervm.yml
