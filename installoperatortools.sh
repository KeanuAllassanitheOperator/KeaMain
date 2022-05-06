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
# Values manipulieren und auf chart anpassen
helm show values prometheus-community/kube-prometheus-stack >> /tmp/kube-prometheus-stack.values
