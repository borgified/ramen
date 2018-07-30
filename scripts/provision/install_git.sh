#!/bin/bash

case "$OS_TYPE" in
  ubuntu*) apt-get install -y git ;;
  debian*) apt-get install -y git ;;
  centos*) yum install -y git ;;
  fedora*) yum install -y git ;;
  opensuse*) zypper -n install git-core ;;
  *) echo "unsupported OS: $OS_TYPE" ;;
esac
