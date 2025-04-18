#!/bin/bash
apt-get update -y
apt-get install -y openjdk-17-jdk

wget https://etinstallers.demoability.dynatracelabs.com/latest/dynatrace-easytravel-linux-x86_64.jar  -O /app.jar
java jar /app.jar & 