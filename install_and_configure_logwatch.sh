#!/bin/bash
# Install and configure logwatch
#
# Tested on Ubuntu 12.04
# Tested on Virtualization type: OpenVZ, KVM, XEN-PV
#
# By: Asim Zeeshan
# http://www.asim.pk/
#
# Helpful hints from
# http://stackoverflow.com/questions/5955548/how-do-i-use-sed-to-change-my-configuration-files-with-flexible-keys-and-values/5955591#5955591
#

# -----------------------------------------------------
# INSTALL LOGWATCH ON DEBIAN BASED SYSTEMS
# -----------------------------------------------------
apt-get clean all
apt-get update && apt-get -q -y upgrade
apt-get install -q -y logwatch

# -----------------------------------------------------
# CONFIGURE Logwatch via bash/perl
#
# IMPORTANT: Change my@email.com to your own email address
# -----------------------------------------------------
sed -i -e '/Output =/ s/= .*/= mail/' /usr/share/logwatch/default.conf/logwatch.conf
sed -i -e '/MailTo =/ s/= .*/= my@email.com/' /usr/share/logwatch/default.conf/logwatch.conf
sed -i -e '/Detail =/ s/= .*/= Med/' /usr/share/logwatch/default.conf/logwatch.conf