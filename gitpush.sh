#!/bin/bash
#bei neuem Projektverzeichnis
git init 
sudo git add .
sudo git commit -m "initial commit"
sudo git push -uf origin remotebranchname
 git remote set-url blackjack git@gitlab.com:keanuallassani/blackjack-game.git # für ssh keys