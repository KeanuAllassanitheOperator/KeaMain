# Script to extract all dependencies from python packages, apt packages and galaxy modules
pip3 freeze > allrequirements.txt
apt list --installed > allpackages
ansible-galaxy collection list > allgalaxymodules
