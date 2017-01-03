# todo...
# disable all but xfce in sddm
# disable assistant on first start of gmpc

# Install one by one because of plasma ???
sudo apt-get --allow-unauthenticated -qy install xserver-xorg xfce4 xinit xdm gmpc gmpc-plugins

#--no-install-recommends 

mkdir /home/botmaster/Desktop/
mkdir /home/botmaster/music/drop_your_music_here
mkdir -p /home/botmaster/.config/autostart/
mkdir /home/botmaster/.config/gmpc/

ln -s /home/botmaster/music/ /home/botmaster/Desktop/music_of_your_bot

# Enable autostart for gmpc
cp /usr/share/applications/gmpc.desktop /home/botmaster/.config/autostart/

# And also create a shortcut on the desktop
cp /usr/share/applications/gmpc.desktop /home/botmaster/Desktop/

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

# Set appropriate permissions to avoid security message on start
chmod u+x /home/botmaster/.config/autostart/botlogging.desktop

# Also copy botlogging.desktop to Desktop
cp /home/botmaster/.config/autostart/botlogging.desktop /home/botmaster/Desktop/


sudo systemctl enable xdm


#autostart gmpc in foreground
#autostart music folder in foreground
#autostart log window in foreground
