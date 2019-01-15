#!/usr/bin/env bash

case $1 in
  stop)
    echo 0 > /proc/sys/net/ipv4/ip_forward
    ;;
  start)
    echo 1 > /proc/sys/net/ipv4/ip_forward
    ;;
esac

echo -e "routing $1ed\ncat /proc/sys/net/ipv4/ip_forward"
cat /proc/sys/net/ipv4/ip_forward
