#!/bin/bash
# Install and configure utorrent (http://www.utorrent.com/) for Ubuntu Linux
#
# Tested on Ubuntu 12.04
# Tested on Virtualization type: OpenVZ, KVM
#
# By: Asim Zeeshan
# http://www.asim.pk/
#
# -----------------------------------------------------
# INSTALL uTorrent ON DEBIAN BASED SYSTEMS
# -----------------------------------------------------

cd /root/
wget http://download.utorrent.com/linux/utorrent-server-3.0-ubuntu-10.10-27079.tar.gz
tar -vxf utorrent-server-3.0-ubuntu-10.10-27079.tar.gz -C /opt/
chmod -R 777 /opt/utorrent-server-v3_0/
ln -s /opt/utorrent-server-v3_0/utserver /usr/bin/utserver
# -----------------------------------------------------
# Install dependency 
# -----------------------------------------------------
apt-get install -q -y libssl0.9.8:i386

# -----------------------------------------------------
# Create the easy-to-use startup utility that will run 
# it as daemon
# -----------------------------------------------------
        cat > /root/run_utorrent <<END
utserver -settingspath /opt/utorrent-server-v3_0/ -daemon
END
chmod 770 /root/run_utorrent
echo "Execute the ~/run_utorrent file to start uTorrent"