# todo...
# open bot configuration in editor on autostart

# Install one by one because of plasma ???
sudo apt-get --allow-unauthenticated -qy install xserver-xorg xfce4 xinit xdm gmpc gmpc-plugins gedit

#--no-install-recommends 

mkdir /home/botmaster/Desktop/
mkdir /home/botmaster/music/drop_your_music_here
mkdir -p /home/botmaster/.config/autostart/

ln -s /home/botmaster/music/ /home/botmaster/Desktop/music_of_your_bot

# Enable autostart for gmpc
mkdir /home/botmaster/.config/gmpc/
cp /usr/share/applications/gmpc.desktop /home/botmaster/.config/autostart/

# Do not run first start assistant of gmpc
cat<<EOF > /home/botmaster/.config/gmpc/gmpc.cfg
[Default]
first_run="0"
EOF

# Create config for gmpc
cat<<EOF > /home/botmaster/.config/gmpc/profiles.cfg
[Default]
hostname="localhost"
name="Default"
password=""
portnumber="7701"
useauth="0"
music directory="/home/botmaster/music/"
db update time="1445647261"
EOF

# And also create a shortcut on the desktop
cp /usr/share/applications/gmpc.desktop /home/botmaster/Desktop/

# Create .desktop for bot live logging and write it to autostart
cat<<EOF > /home/botmaster/.config/autostart/botlogging.desktop
[Desktop Entry]
Exec=/home/botmaster/src/mumble-ruby-pluginbot/scripts/manage.sh log
GenericName=Watch bot logs live
Icon=exec
MimeType=
Name=Watch bot logs live
Path=
StartupNotify=true
Terminal=true
TerminalOptions=
Type=Application
EOF

# Create .desktop for bot restart and write it to autostart
cat<<EOF > /home/botmaster/.config/autostart/botrestart.desktop
[Desktop Entry]
Exec=/home/botmaster/src/mumble-ruby-pluginbot/scripts/manage.sh restart
GenericName=Restart your bot
Icon=exec
MimeType=
Name=Restart your bot
Path=
StartupNotify=true
Terminal=true
TerminalOptions=
Type=Application
EOF

# Create .desktop for editing the bots configuration file and write it to autostart
cat<<EOF > /home/botmaster/.config/autostart/botedit.desktop
[Desktop Entry]
Exec=/usr/bin/gedit /home/botmaster/src/bot1_conf.yml
GenericName=Edit your bots configuration file
Icon=exec
MimeType=
Name=Edit your bots configuration file
Path=
StartupNotify=true
Terminal=true
TerminalOptions=
Type=Application
EOF

# Set appropriate permissions to avoid security message on start
chmod u+x /home/botmaster/.config/autostart/botlogging.desktop

# Also copy botlogging.desktop to Desktop
cp /home/botmaster/.config/autostart/botlogging.desktop /home/botmaster/Desktop/


sudo systemctl enable xdm


#autostart gmpc in foreground
#autostart music folder in foreground
#autostart log window in foreground
