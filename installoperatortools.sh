#!/bin/bash
sudo apt update -y
sudo apt install ansible -y
sudo mkdir ansible-playbooks
sudo apt install vagrant -y
sudo apt install ruby-dev build-essential libmysqlclient-dev rubygems -y
gem install nokogiri --platform=ruby
vagrant plugin install vagrant-vsphere vagrant-env
sudo ansible-galaxy collection install kubernetes.core
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
echo "/srv/nfs/kubedata*(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)" > /etc/exports
