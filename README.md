# mumble-ruby-pluginbot-appliance
some stuff for creating/updating/exporting a VirtualBox Appliance for Mumble-Ruby-Pluginbot.

## Documentation about the Appliance
See http://mumble-ruby-pluginbot.rtfd.io/en/master/appliance.html

## Export the appliance by hand
### Terminal version
Clone the VM "Mumble-Ruby-Pluginbot" to "Mumble-Ruby-Pluginbot Terminal".

Start the VM, login as botmaster and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/export.sh

Shutdown VM.

Remove all snapshots.

Open a Terminal on your PC and do:

    VBoxManage modifymedium --compact /path/to/disk1.vdi
    VBoxManage modifymedium --compact /path/to/disk2.vdi
    
    If the above commands do not work because of an error use the UUID of the discs instead that is shown in the error message.

    export VAVERSION="0.10.5-Terminal"

    VBoxManage export "Mumble-Ruby-Pluginbot" \
     --output "$HOME/Mumble-Ruby-Pluginbot-${VAVERSION}.ova" --vsys 0 --ovf20 \
     --product "Virtualbox appliance for Mumble-Ruby-Pluginbot" \
     --producturl "http://mumble-ruby-pluginbot.rtfd.io/en/master/appliance.html" \
     --vendor Natenom --vendorurl "https://www.natenom.com" --version "${VAVERSION}"

Create a snapshot for the current version for the VM.

### GUI version

Clone the VM "Mumble-Ruby-Pluginbot" to "Mumble-Ruby-Pluginbot GUI".

Start the VM, login as botmaster and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/install_desktop.sh

    sudo dpkg --configure -a

    ~/src/.export/mumble-ruby-pluginbot-appliance/install_desktop.sh

Reboot VM and login on the desktop, do the first steps with GMPC.

Switch to VT2 and run:

    ~/src/.export/mumble-ruby-pluginbot-appliance/export.sh

Shutdown VM.

Remove all snapshots.

Open a terminal on your PC and do:

    VBoxManage modifymedium --compact /path/to_cloned/disk1.vdi
    VBoxManage modifymedium --compact /path/to_cloned/disk2.vdi
    
    If the above commands do not work because of an error use the UUID of the discs instead that is shown in the error message.

    export VAVERSION="0.10.5-GUI"

    VBoxManage export "Mumble-Ruby-Pluginbot GUI" \
     --output "$HOME/Mumble-Ruby-Pluginbot-${VAVERSION}.ova" --vsys 0 --ovf20 \
     --product "Virtualbox appliance for Mumble-Ruby-Pluginbot" \
     --producturl "http://mumble-ruby-pluginbot.rtfd.io/en/master/appliance.html" \
     --vendor Natenom --vendorurl "https://www.natenom.com" --version "${VAVERSION}"

Remove the cloned VM.
