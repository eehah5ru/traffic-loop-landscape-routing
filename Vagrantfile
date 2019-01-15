# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "server1" do |server1|
		server1.vm.box = "centos/7"
		server1.vm.network "private_network", ip: "192.168.202.2"
		server1.vm.network "private_network", ip: "192.168.200.1"
		server1.vm.hostname = "server1"
		server1.vm.provider :virtualbox do |vb|
			vb.name = "server1"
		end
		server1.vm.provision "shell", path: "provisioning/provision.sh"
	end

	config.vm.define "server2" do |server2|
		server2.vm.box = "centos/7"
		server2.vm.network "private_network", ip: "192.168.200.2"
		server2.vm.network "private_network", ip: "192.168.201.1"
		server2.vm.hostname = "server2"
		server2.vm.provider :virtualbox do |vb|
			vb.name = "server2"
		end
		server2.vm.provision "shell", path: "provisioning/provision.sh"
	end

	config.vm.define "server3" do |server3|
		server3.vm.box = "centos/7"
		server3.vm.network "private_network", ip: "192.168.201.2"
		server3.vm.network "private_network", ip: "192.168.202.1"
		server3.vm.hostname = "server3"
		server3.vm.provider :virtualbox do |vb|
			vb.name = "server3"
		end
		server3.vm.provision "shell", path: "provisioning/provision.sh"
	end
	
end