#!/usr/bin/env python
from scapy.all import *

sourceip = '192.168.254.1'
destip = '10.10.10.10'
sourceport = '16000'
destport = '16001'
message = 'test'

packet = IP(src=sourceip, dst=destip)/TCP(dport=80,flags="S")/message
send(packet)
