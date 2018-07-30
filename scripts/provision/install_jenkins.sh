#!/bin/bash

# https://jenkins.io/doc/book/installing/
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y

. "/vagrant/scripts/provision/install_java.sh"
sudo apt-get install -y jenkins

sed -i 's/JENKINS_HOME=.*/JENKINS_HOME=\/vagrant\/jenkins_home/' /etc/default/jenkins
sed -i 's/JENKINS_USER=.*/JENKINS_USER=vagrant/' /etc/default/jenkins
sed -i 's/JENKINS_GROUP=.*/JENKINS_GROUP=vagrant/' /etc/default/jenkins
chown -R vagrant: /var/log/jenkins
chown -R vagrant: /var/cache/jenkins

systemctl restart jenkins
