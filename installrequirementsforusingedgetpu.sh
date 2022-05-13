#!/bin/bash
echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install libedgetpu1-std
# Um den Prozessor zu übertakten bitte dieses Paket installieren (wäre ich aber mit vorsichtig) Nicht beide libs installieren, da ansonsten der Prozessor nicht weiß in welchem Takt er die Modelle runnen lassen sollen
sudo apt-get install libedgetpu1-max
sudo apt-get install python3-pycoral
# Ein Linux Bildanzeigeprogramm für die Python Bibliotehk Pillow da ansonsten Pillow nicht das Bild anzeigt.
sudo apt-get install imagemagick
mkdir coral && cd coral
git clone https://github.com/google-coral/pycoral.git
cd pycoral
# Erstes Modell runnen lassen, um die Inferenzgeschwindigkeit des Prozessors zu testen. Sprich wie lange braucht der Prozessor bei Eingabedaten um die Ausgabe der Ki zu berechnen und Ergebnisse auszuspucken
bash examples/install_requirements.sh classify_image.py
python3 examples/classify_image.py \
--model test_data/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
--labels test_data/inat_bird_labels.txt \
--input test_data/parrot.jpg
