#!/bin/bash
#https://www.linuxtechi.com/install-ansible-awx-on-ubuntu/
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu\
$(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER
sudo systemctl restart docker
docker version
docker-compose version
sudo apt install -y ansible
ansible --version
sudo apt install -y nodejs npm
sudo npm install npm --global
wget https://github.com/ansible/awx/archive/17.1.0.zip
sudo unzip 17.1.0.zip
cd awx-17.1.0/installer
DecryptKey=$( pwgen -N 1 -s 30)
sed 's/# admin_password=password/admin_password=ansible1234#/g'
sed 's/secret_key=awxsecret/secret_key=$DecryptKey/g'
ansible-playbook -i inventory install.yml
sudo systemctl status docker
