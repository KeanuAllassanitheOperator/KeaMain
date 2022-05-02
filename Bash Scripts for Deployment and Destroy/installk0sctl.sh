#!/bin/bash
VER=$(curl -s https://api.github.com/repos/k0sproject/k0sctl/releases/latest|grep tag_name | cut -d '"' -f 4)
echo $VER
wget https://github.com/k0sproject/k0sctl/releases/download/${VER}/k0sctl-linux-x64 -O k0sctl
sudo chmod +x k0sctl
sudo cp -r k0sctl /usr/local/bin/ /bin
sudo sh -c 'k0sctl completion >/etc/bash_completion.d/k0sctl'
sudo k0sctl version
echo "k0sctl installed"
