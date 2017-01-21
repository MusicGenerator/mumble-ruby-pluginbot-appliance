# mumble-ruby-pluginbot-appliance
some stuff for creating/updating/exporting a VirtualBox Appliance for Mumble-Ruby-Pluginbot.

## Documentation about the Appliance
See http://mumble-ruby-pluginbot.rtfd.io/en/master/appliance.html

## Things that have to be done before exporting the VBox as a virtual appliance:
This was automated, see mumble-ruby-pluginbot-do-export.sh in this repository.

Then close the virtualbox and select "send shutdown signal".

Simply login as botmaster and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/export.sh

## Use the following command to export it on the command line interface
### First shrink both disks



### Then export the appliance by hand
#### Terminal version

* Start the VM and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/export.sh

* Shutdown VM.
* Remove all snapshots.
* Open a Terminal on your PC and do:

    VBoxManage modifymedium --compact /path/to/disk1.vdi
    VBoxManage modifymedium --compact /path/to/disk1.vdi

    export VAVERSION="0.10.2-Terminal"

    VBoxManage export "Mumble-Ruby-Pluginbot" \
     --output "$HOME/Mumble-Ruby-Pluginbot-${VAVERSION}.ova" --vsys 0 --ovf20 \
     --product "Virtualbox appliance for Mumble-Ruby-Pluginbot" \
     --producturl "http://mumble-ruby-pluginbot.rtfd.io/en/master/appliance.html" \
     --vendor Natenom --vendorurl "https://www.natenom.com" --version "${VAVERSION}"

* Create a snapshot for the current version for the VM.

#### GUI version

* Clone the VM "Mumble-Ruby-Pluginbot" to "Mumble-Ruby-Pluginbot GUI".
* Start the new VM and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/install_desktop.sh

    sudo dpkg --configure -a

    ~/src/.export/mumble-ruby-pluginbot-appliance/install_desktop.sh

* Reboot VM and login on the desktop, do the first steps with GMPC.
* Switch to VT2 and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/export.sh

* Shutdown VM.
* Remove all snapshots.
* Open a terminal on your PC and do:

    VBoxManage modifymedium --compact /path/to_cloned/disk1.vdi
    VBoxManage modifymedium --compact /path/to_cloned/disk1.vdi

    export VAVERSION="0.10.2-GUI"

    VBoxManage export "Mumble-Ruby-Pluginbot GUI" \
     --output "$HOME/Mumble-Ruby-Pluginbot-${VAVERSION}.ova" --vsys 0 --ovf20 \
     --product "Virtualbox appliance for Mumble-Ruby-Pluginbot" \
     --producturl "http://mumble-ruby-pluginbot.rtfd.io/en/master/appliance.html" \
     --vendor Natenom --vendorurl "https://www.natenom.com" --version "${VAVERSION}"

* Remove the cloned VM.
