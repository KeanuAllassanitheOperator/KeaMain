#!/bin/bash
sudo apt update -y
sudo apt install ansible -y
sudo mkdir ansible-playbooks
sudo apt install vagrant -y
sudo apt install ruby-dev build-essentials libmysqlclient-dev -y
gem install nokogiri --platform=ruby
vagrant plugin install vagrant-vsphere vagrant-env 
vagrant status
