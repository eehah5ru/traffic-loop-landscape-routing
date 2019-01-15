#!/usr/bin/env bash

cat /vagrant/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
cp /vagrant/provisioning/routing.sh ~vagrant/
sudo yum install -y tcpdump python vim telnet  net-tools nmap
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sudo sysctl -p

case $HOSTNAME in
  server1)
    sudo ip ro add 192.168.50.0/24 via 192.168.200.2
	sudo echo "net.ipv4.conf.eth3.rp_filter = 0" >> /etc/sysctl.conf
	;;
  server2)
    sudo ip ro add 192.168.50.0/24 via 192.168.201.2
	;;
  server3)
    sudo ip ro add 192.168.50.0/24 via 192.168.202.2
	;;
  client)
    sudo ip ro add 192.168.50.0/24 via 192.168.203.1
	;;
esac

case $HOSTNAME in
  server1|server2|server3)
	sudo echo "net.ipv4.conf.all.rp_filter = 0" >> /etc/sysctl.conf
	sudo echo "net.ipv4.conf.default.rp_filter = 0" >> /etc/sysctl.conf
	sudo echo "net.ipv4.conf.eth0.rp_filter = 0" >> /etc/sysctl.conf
	sudo echo "net.ipv4.conf.eth1.rp_filter = 0" >> /etc/sysctl.conf
	sudo echo "net.ipv4.conf.eth2.rp_filter = 0" >> /etc/sysctl.conf
	sudo echo "net.ipv4.conf.lo.rp_filter = 0" >> /etc/sysctl.conf
	sudo sysctl -p	
	sudo iptables -t mangle -A PREROUTING -i eth1 -d 192.168.50.10 -j TTL --ttl-set 64
	;;
esac

