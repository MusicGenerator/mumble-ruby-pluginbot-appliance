#!/bin/bash
# Install a development environment for the Mumble-Ruby-Pluginbot remoteui

sudo apt-get --allow-unauthenticated -qy install ruby lighttpd

cd /home/botmaster/src/mumble-ruby-pluginbot
git fetch
git checkout devel
git pull origin devel

cp /home/botmaster/src/mumble-ruby-pluginbot/config/config.yml /home/botmaster/src/bot1_conf.yml

sed -r -i -e 's/(remoteui: false)/remoteui: true/g' /home/botmaster/src/bot1_conf.yml

# Overwrite default lighttpd config
cat<<EOF > /etc/lighttpd/lighttpd.conf
server.port             = 80
server.username         = "botmaster"
server.groupname        = "botmaster"
server.document-root    = "/home/botmaster/src/mumble-ruby-pluginbot/http/"
server.errorlog         = "/home/botmaster/logs/lighttpd_error.log"
server.max-request-field-size = 200000
server.max-request-size = 500
dir-listing.activate    = "enable"
index-file.names        = ( "index.html" )
mimetype.assign         = (
                                ".html" => "text/html",
                                ".txt" => "text/plain",
                                ".css" => "text/css",
                                ".js" => "application/x-javascript",
                                ".jpg" => "image/jpeg",
                                ".jpeg" => "image/jpeg",
                                ".gif" => "image/gif",
                                ".png" => "image/png",
                                "" => "application/octet-stream"

server.modules += ( "mod_cgi" )

cgi.assign                 = ( ".rb"  => "/usr/bin/ruby" )

index-file.names           += ("index.rb",   "default.rb" )
EOF

systemctl restart lighttpd
systemctl restart mumblerubypluginbot

echo "Ready :) Now you can create a port forwarding from outside to port 80 on this machine."
