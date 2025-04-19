#!/bin/bash
apt-get update -y
apt-get install -y openjdk-11-jdk
mkdir /opt/easytravel/
cd /opt/easytravel/
wget https://etinstallers.demoability.dynatracelabs.com/latest/dynatrace-easytravel-linux-x86_64.jar
chmod 755 dynatrace-easytravel-linux-x86_64.jar
java -jar dynatrace-easytravel-linux-x86_64.jar -y

if [ ! -f "/opt/easytravel/easytravel-2.0.0-x64/weblauncher/weblauncher.sh" ]; then
    echo "Erro: weblauncher.sh não encontrado após extração!"
    exit 1
fi

cd easytravel-2.0.0-x64/weblauncher 
nohup ./weblauncher.sh &