#!/bin/bash
sudo apt install git -y
sudo apt install ansible -y
sudo apt install sshpass -y
sudo mkdir ansible-playbooks
sudo apt install vagrant -y
sudo apt install toilet -y 
sudo apt install ruby-dev build-essential libmysqlclient-dev rubygems -y
gem install nokogiri --platform=ruby
vagrant plugin install vagrant-env vagrant-vsphere
VER=$(curl -s https://api.github.com/repos/k0sproject/k0sctl/releases/latest|grep tag_name | cut -d '"' -f 4)
sudo wget https://github.com/k0sproject/k0sctl/releases/download/${VER}/k0sctl-linux-x64 -O k0sctl
sudo chmod +x k0sctl
sudo cp k0sctl /usr/local/bin/ 
sudo cp k0sctl /bin
sudo sh -c 'k0sctl completion >/etc/bash_completion.d/k0sctl'
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
sudo ansible-galaxy collection install community.vmware ansible.windows kubernetes.core community.windows
sudo apt install nfs-kernel-server
echo "/srv/nfs/kubedata    *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)" > /etc/exports
touch ~/.ssh/known_hosts
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo mkdir /srv/nfs
sudo mkdir /srv/nfs/kubedata
sudo apt install pip 
pip install PyYAML
helm plugin install https://github.com/databus23/helm-diff
sudo apt install figlet
pip3 install pyVim

# Values manipulieren und auf chart anpassen und in das richtige verzeichnis packen für neue Microservices, damit die Daten davon persistent gespeichert werden
helm repo add reponame repourl
helm show values chart >> /tmp/chartname.values
mv to chart directory with playbooks 
storageClassName anpassen auf den Namen nfs-client
# Am besten immer auf musterbeispiele der anderen micorservices sich das abschaun
ansible-galaxy collection install ansible.windows
pip3 install pywinrm[credssp]
pip3 install pywinrm[kerberos]
python3 -m pip install --ignore-installed pywinrm
touch ~/.bash_aliases && echo "alias k='kubectl'" > ~/.bash_aliases
# Um den Output von API Reqs als Json Reqs aufzurufen und im Json Format lesen können was passiert ist
sudo apt install jq 
ansible-galaxy collection install tribe29.checkmk
sudo apt-get install yamllint
ansible-galaxy collection install community.mysql
# Python Virtual Environments erstellen
https://www.redhat.com/sysadmin/python-venv-ansible
python3 -m venv ansible2.12.5
source ansible2.12.5/bin/activate
python3 -m pip install ansible==2.9
pip3 install --upgrade pip setuptools
pip3 install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git
pip3 install PyVmomi
pip3 install pyVim
pip3 install PyMySQL 
ansible-galaxy collection install community.windows
# JSON Queries und Parsing für python nutzen
pip3 install jmespath
ansible-galaxy collection install community.docker
