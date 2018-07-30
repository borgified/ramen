Vagrant.configure("2") do |config|
  config.vm.define "jenkins" do |master|
    master.vm.box = "bento/ubuntu-16.04"
    master.vm.hostname = 'jenkins'

    master.vm.network :private_network, ip: "192.168.56.101"

    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "jenkins"]
    end

  end

  boxes = ["bento/centos-7", "bento/centos-6", 
           "bento/debian-8", "bento/debian-9", 
           "bento/fedora-27", "bento/fedora-28", 
           "bento/ubuntu-14.04", "bento/ubuntu-16.04", "bento/ubuntu-18.04", 
           "bento/opensuse-leap-42", "bento/opensuse-13.2" ]

  (0..boxes.length-1).each do |i|
    box_name = boxes[i].split("/").last.gsub(/-|\./,"")

    config.vm.define "#{box_name}" do |subconfig|
      subconfig.vm.box = boxes[i]
      subconfig.vm.hostname = "#{box_name}"

      subconfig.vm.network :private_network, ip: "192.168.56.#{102 + i}"

      subconfig.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 512]
        v.customize ["modifyvm", :id, "--name", "#{box_name}"]
      end
    end
  end

  config.vm.provision "shell", path: "scripts/provision/install.sh"

end
