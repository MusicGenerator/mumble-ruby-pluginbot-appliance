# mumble-ruby-pluginbot-appliance
some stuff for creating/updating/exporting a VirtualBox Appliance for Mumble-Ruby-Pluginbot

## Documentation about the Appliance
See http://mumble-ruby-pluginbot.readthedocs.io/en/latest/appliance.html

## Things that have to be done before exporting the VBox as a virtual appliance:
This was automated, see [this script](https://github.com/Natenom/mumble-ruby-related/blob/master/scripts/mumble-ruby-pluginbot-do-export.sh)

Then close the virtualbox and select "send shutdown signal".

Simply login as botmaster and run:

    ~/src/.export/mumble-ruby-pluginbot-do-export.sh

## Use the following command to export it on the command line interface
    export VAVERSION=2.0.6; VBoxManage export "Mumble-Ruby-Pluginbot" --output "$HOME/Mumble-Ruby-Pluginbot-${VAVERSION}.ova" \
    --vsys 0 --ovf20 --product "Virtualbox appliance for Mumble-Ruby-Pluginbot" \
    --producturl "https://wiki.natenom.com/w/VirtualBox_Appliance_for_Mumble-Ruby-Pluginbot" \
    --vendor Natenom --vendorurl "https://www.natenom.com" --version "${VAVERSION}"
