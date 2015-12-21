# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  # Zookeeper Ports
  config.vm.network "forwarded_port", guest: 2181, host: 2181
  config.vm.network "forwarded_port", guest: 2888, host: 2888
  config.vm.network "forwarded_port", guest: 3888, host: 3888
  # Coordinator Ports
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  # Overlord Ports
  config.vm.network "forwarded_port", guest: 8090, host: 8090

  config.vm.provision "ansible" do |ansible|
    ansible.groups = {
      "master_servers" => ["default"],
    }
    ansible.verbose = "v"
    ansible.playbook = "site.yml"
  end
end
