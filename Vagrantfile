# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  # Middle Manager Ports
  config.vm.network "forwarded_port", guest: 8091, host: 8091
  # Historical Ports
  config.vm.network "forwarded_port", guest: 8083, host: 8083

  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "data_servers" => ["default"],
    }
    ansible.verbose = "v"
    ansible.playbook = "provision.yml"
  end
end
