#!/bin/bash

# This scripts automates stuff that needs to be done before the Mumble-Ruby-Pluginbot Virtualbox appliance can be exported.
# http://mumble-ruby-pluginbot.readthedocs.io/en/latest/appliance.html

set -x

rm /home/botmaster/logs/*.log
rm -rf /home/botmaster/music /home/botmaster/temp
mkdir /home/botmaster/music /home/botmaster/temp

mpc -p 7701 clear

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get clean

~/src/mumble-ruby-pluginbot/scripts/updater.sh
sudo fstrim -v /
sudo fstrim -v /home
history -c

echo "Export preparations done..."
