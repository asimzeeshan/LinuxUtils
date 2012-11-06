#!/bin/bash
# Install OpenVPN-AS Server
#
# Tested on Ubuntu 12.04 32bit
# Tested on Virtualization type: OpenVZ, XEN-PV and KVM
#
# By: Asim Zeeshan
# http://www.asim.pk/
#
# P.S. Some routines taken from LowEndBox/LowEndScript
#      https://github.com/lowendbox/lowendscript
#
############################################################
# core functions
############################################################
function check_install {
        if [ -z "`which "$1" 2>/dev/null`" ]
        then
                executable=$1
                shift
                while [ -n "$1" ]
                do
                        DEBIAN_FRONTEND=noninteractive apt-get -q -y install "$1"
                        print_info "$1 installed for $executable"
                        shift
                done
        else
                print_warn "$2 already installed"
        fi
}

function check_sanity {
        # Do some sanity checking.
        if [ $(/usr/bin/id -u) != "0" ]
        then
                die 'Must be run by root user'
        fi

        if [ ! -f /etc/debian_version ]
        then
                die "Distribution is not supported"
        fi
}

function print_info {
        echo -n -e '\e[1;36m'
        echo -n $1
        echo -e '\e[0m'
}

function print_warn {
        echo -n -e '\e[1;33m'
        echo -n $1
        echo -e '\e[0m'
}

############################################################
# Now coming back to what we need to do ;)
############################################################
print_warn "Please note that this will overwrite the previous installation, if any"
print_warn "Visit OpenVPN-AS page for more info"
print_warn "http://openvpn.net/index.php/access-server/download-openvpn-as-sw/113.html?osfamily=Ubuntu"
print_info "This script is going to install OpenVPN-AS on Ubuntu 10.x 32bit"
wget http://swupdate.openvpn.org/as/openvpn-as-1.8.4-Ubuntu10.i386.deb
dpkg -i openvpn-as-1.8.4-Ubuntu10.i386.deb
print_warn "Set the default password for user openvpn"
passwd openvpn