#!/bin/bash

. "/vagrant/scripts/provision/detect_os.sh"
echo "Detected OS: $OS_TYPE"
. "/vagrant/scripts/provision/install_avahi.sh"
. "/vagrant/scripts/provision/install_git.sh"

if [[ "$HOSTNAME" == "jenkins" ]]; then
  . "/vagrant/scripts/provision/install_jenkins.sh"
else
  . "/vagrant/scripts/provision/install_swarm.sh"
fi
