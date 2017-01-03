sudo apt-get install xinit xfce4 sddm gmpc gmpc-plugins
sudo systemctl enable sddm
sudo systemctl restart sddm

mkdir /home/botmaster/Desktop/
mkdir /home/botmaster/music/drop_your_music_here

ln -s /home/botmaster/music/ /home/botmaster/Desktop/music_of_your_bot

mkdir /home/botmaster/.config/gmpc/
mkdir /home/botmaster/.autostart/

# Enable autostart for gmpc
cp /usr/share/applications/gmpc.desktop /home/botmaster/.config/autostart/

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

#autostart gmpc in foreground
#autostart music folder in foreground
#autostart log window in foreground
