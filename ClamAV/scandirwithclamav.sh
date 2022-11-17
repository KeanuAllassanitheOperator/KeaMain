# Scannt ein angebenenes Verzeichnis rekursiv auf Viren
DIR=$1

if [$# -ne 1 ]; then

echo "Usage: $0 <dir> You need to specify a directory"


fi
sudo clamscan $DIR
