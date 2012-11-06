#!/bin/bash
# Install and configure VNC for Ubuntu Linux
#
# Tested on Ubuntu 12.04
# Tested on Virtualization type: OpenVZ, KVM
#
# Script by: Asim Zeeshan
# http://www.asim.pk/
#
# Original Posted by VPS6.NET (https://vps6.net)
# Post URL: http://www.lowendtalk.com/discussion/1065/how-to-install-vnc-w-gnome-on-debian-vps
#

apt-get clean all
apt-get update
apt-get upgrade

# ##########################################################
# Install GNOME

apt-get install gnome-desktop-environment

# ##########################################################
# Install required fonts

apt-get install xfonts-100dpi
apt-get install xfonts-100dpi-transcoded
apt-get install xfonts-75dpi
apt-get install xfonts-75dpi-transcoded
apt-get install xfonts-base

# ##########################################################
# Install TightVNCServer and setup VNC password

apt-get install tightvncserver
tightvncserver :1

# ##########################################################
# Kill VNC instance at 5901 to continue with the configuration

tightvncserver -kill :1

# ##########################################################
# Edit the xstartup file

        cat > ~/.vnc/xstartup <<END
#!/bin/shxrdb $HOME/.Xresources
xsetroot -solid grey
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
# x-window-manager &
gnome-session &
END

# ##########################################################
# Finally, start the first VNC session
# Its accessible at XXX.XXX.XXX.XXX:5901 with the same 
# password that you have set in the config above

tightvncserver -geometry 1024x768 :1