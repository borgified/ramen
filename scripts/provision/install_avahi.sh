#!/bin/bash

case "$OS_TYPE" in
  ubuntu*) apt-get install -y avahi-daemon libnss-mdns ;;
  debian*) apt-get install -y avahi-daemon libnss-mdns ;;
  centos*) yum install -y avahi nss-mdns ;;
  fedora*) yum install -y avahi nss-mdns ;;
  opensuse*) zypper -n install avahi nss-mdns ;;
  *) echo "unsupported OS: $OS_TYPE" ;;
esac
