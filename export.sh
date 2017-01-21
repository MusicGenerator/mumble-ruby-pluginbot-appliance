#!/bin/bash

# This scripts automates stuff that needs to be done before the Mumble-Ruby-Pluginbot Virtualbox appliance can be exported.
# http://mumble-ruby-pluginbot.readthedocs.io/en/latest/appliance.html

rm -rf /home/botmaster/logs/*.log
rm -rf /home/botmaster/music /home/botmaster/temp
mkdir /home/botmaster/music /home/botmaster/temp

# Remove existing certificates
rm -rf /home/botmaster/certs
mkdir /home/botmaster/certs

mpc -p 7701 clear

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get clean

~/src/mumble-ruby-pluginbot/scripts/updater.sh

history -c
rm -rf /home/botmaster/.bash_history

sudo rm -rf /root/.bash_history

sudo find /var/ -iname "*log" -type f -delete

sudo fstrim -v /
sudo fstrim -v /home

echo "Export done. Shutdown the machine now."
