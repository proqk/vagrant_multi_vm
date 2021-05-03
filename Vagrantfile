# -*- mode: ruby -*-
# vi: set ft=ruby :
# Example Multi-Box edited by Jessica Rankins 4/17/2017

ADDITIONALFILES = Dir.pwd + "/VagrantMultiAdditionalFiles"


  # All Vagrant configuration is done below. The "2" in Vagrant.configure
  # configures the configuration version.
Vagrant.configure("2") do |config|

  config.vm.synced_folder Dir.pwd, "/vagrant", disabled: true
  config.vm.box = "hashicorp/precise64"	

  # Configure the Web Server
  config.vm.define "WebExampleBox" do |web|
    web.vm.provider :virtualbox do |vb|
      vb.name = "WebBox"
      vb.memory = 1024
      vb.customize ["modifyvm", :id, "--description", "WebBox is an apache VM used to demonstrate Infrastructure as code principles via Vagrant. It is also used to demonstrate defining multiple machines in a single Vagrantfile."]
    end

    # After vagrant up, should see VM's web page in browser at 192.168.3.5
    web.vm.network "private_network", ip: "192.168.3.5"
    web.vm.hostname = "Web"
    web.vm.synced_folder ADDITIONALFILES, "/var/www"
    web.vm.provision :shell, path: "web_provision.sh"

    # display this message at end of vagrant up
    config.vm.post_up_message = "Successfully started Web."
  end


  # Configure the Database
  config.vm.define "DBExampleBox" do |db|
    db.vm.provider :virtualbox do |vb|
      vb.name = "DBBox"
      vb.memory = 1024
      vb.customize ["modifyvm", :id, "--description", "DBBox is a mysql VM used to demonstrate Infrastructure as code principles via Vagrant. It is also used to demonstrate defining multiple machines in a single Vagrantfile."]
    end

    db.vm.hostname = "DB"
    db.vm.provision :shell, path: "db_provision.sh"
    db.vm.network "private_network", ip: "192.168.3.6"
   
    # display this message at end of vagrant up
    config.vm.post_up_message = "Successfully started DB."
  end
  
end    # End configuring