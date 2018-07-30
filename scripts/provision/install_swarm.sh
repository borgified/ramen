#!/bin/bash

. "/vagrant/scripts/provision/install_java.sh"

wget -q https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.9/swarm-client-3.9.jar
java -jar swarm-client-3.9.jar -username admin -password admin -master http://jenkins.local:8080 -labels $OS_TYPE &
disown
