#!/bin/bash

file_path=/userdata/master_server/install_elk_server
echo 0 >/selinux/enforce
groupadd kibana
useradd -g kibana kibana
wget -N -P /opt/ https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz
cd /opt;tar xvf kibana-4.3.0-linux-x64.tar.gz
mv kibana-4.3.0-linux-x64 kibana
cp -rf $file_path/kibana.yml /opt/kibana/config/
chown -R kibana:kibana /opt/kibana
curl -o /etc/init.d/kibana https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-init
curl -o /etc/default/kibana https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/fc5025c3fc499ad8262aff34ba7fde8c87ead7c0/kibana-4.x-default
chmod 755 /etc/init.d/kibana
chmod 755 /etc/default/kibana
service kibana start
chkconfig kibana on
