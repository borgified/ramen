ramen

one command local jenkins deploy with self registering workers

use case: packaging software for various OS distributions and architectures

prereqs:
 - [vagrant](https://vagrantup.com)

quickstart:

1. `git clone https://github.com/borgified/ramen.git`
2. `cd ramen`
3. `vagrant up`

this brings up the jenkins master and all the slaves. it will take a while, especially if you are downloading the various [bento boxes](https://app.vagrantup.com/bento/) for the first time.


if you dont need all the slaves, you can bring up each piece individually:
  - `vagrant up jenkins` : bring up just the jenkins master. access via: [http://jenkins.local:8080](http://jenkins.local:8080) admin/admin
  - `vagrant status` : lists all the workers available
  - `vagrant up <worker>` : eg. `vagrant up ubuntu1604` bring up a specific worker
  - `vagrant destroy <worker>` : kill off any workers you dont need
  - `vagrant destroy -f` : destroy everything w/o confirmation


when jenkins master comes up, it will use the `jenkins_home` directory in this repository where the swarm plugin is already installed. it had to be preconfigured with __username:admin, password: admin credentials__ to allow the [swarm plugin](https://wiki.jenkins.io/display/JENKINS/Swarm+Plugin) to work, since it needs to know the credentials of the master in order to self register. (`see scripts/provision/install_swarm.sh`)

to reiterate: if you want to change the jenkins master admin credentials (admin/admin), remember to also change it in `scripts/provision/install_swarm.sh` so that workers can successfully self register to the master

