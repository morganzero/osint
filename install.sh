#!/bin/bash
# AUTHOR: Lucksi
# Copyright © 2021 Lucksi
# License: GNU General Public License v3.0

. /etc/os-release

function Preference {
  echo '{
    "Language":{
        "Preference":"English"
    }
  }'>GUI/Language/Language.json
  mode="ENGLISH"

  echo '{
    "Color":{
        "Background":"Dark"
    }
  }'>GUI/Theme/Mode.json
  mode="DARK"
}

function Packet_Installer {
  sudo apt-get install git &> /dev/null | printf "\nInstalling Git\n"
  sudo apt-get install python3 &> /dev/null | printf "\nInstalling Python3\n"
  sudo apt-get install python3-pip &> /dev/null | printf "\nInstalling pip"
  sudo apt-get install whois &> /dev/null | printf "\n\nInstalling WhoIS"
  sudo apt-get install inetutils-traceroute &> /dev/null | printf "\n\nInstalling TraceRoute"
  sudo apt-get install php &> /dev/null | printf "\n\nInstalling PHP"
  sudo pip3 install -r requirements.txt &> /dev/null | printf "\n\nInstalling-Python-Requirements..."
}

Packet_Installer
cd ../
cd Core
sudo chmod +x update.sh
cd ../
cd ../
echo "Path = `pwd`">>Configuration/Configuration.ini
exit 1
