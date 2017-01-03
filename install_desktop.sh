sudo apt-get install xinit xfce4 sddm gmpc gmpc-plugins
sudo systemctl enable sddm
sudo systemctl restart sddm

mkdir /home/botmaster/Desktop/
mkdir /home/botmaster/music/drop_your_music_here

ln -s /home/botmaster/music/ /home/botmaster/Desktop/music_of_your_bot

mkdir /home/botmaster/.config/gmpc/

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

#autostart gmpc in foreground
#autostart music folder in foreground
#autostart log window in foreground
