#!/bin/bash
# Run only after altering /etc/resolv.conf to point to the internal network's DNS server (port scan for tcp/53)
for ip in $(cat lab-targets.txt); do
host ${ip}
done
