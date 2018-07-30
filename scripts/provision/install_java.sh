#!/bin/bash

ubuntu1404 () {
  apt-get install -y python-software-properties debconf-utils software-properties-common
  add-apt-repository -y ppa:webupd8team/java
  apt-get update
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
  apt-get install -y oracle-java8-installer
}

debian8 () {
  echo "deb http://http.debian.net/debian jessie-backports main" | \
      sudo tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null
  apt-get update
  apt-get install -y -t jessie-backports openjdk-8-jdk
}

case "$OS_TYPE" in
  ubuntu14*) ubuntu1404 ;;
  ubuntu*) apt-get install -y openjdk-8-jre ;;
  debian8) debian8 ;;
  debian*) apt-get install -y default-jre ;;
  centos*) yum install -y java-1.8.0-openjdk ;;
  fedora*) yum install -y java-1.8.0-openjdk ;;
  opensuse*) zypper -n install java-1_8_0-openjdk ;;
  *) echo "unsupported OS: $OS_TYPE" ;;
esac

