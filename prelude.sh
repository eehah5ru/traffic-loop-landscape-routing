#!/bin/bash

#
# from server1
#
# ping server2
vagrant ssh server1 -- "ping -c 2 192.168.200.2"
# ping server3
vagrant ssh server1 -- "ping -c 2 192.168.202.1"

#
# from server2
#
# ping server1
vagrant ssh server2 -- "ping -c 2 192.168.200.1"
# ping server3
vagrant ssh server2 -- "ping -c 2 192.168.201.2"

#
# from server3
#
# ping server1
vagrant ssh server3 -- "ping -c 2 192.168.202.2"
# ping server2
vagrant ssh server3 -- "ping -c 2 192.168.201.1"
