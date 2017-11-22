#!/bin/bash
# Reverse DNS Lookup w/ Host

# If DNS PTR records have been configured for the domain, the following reverse DNS script can be used to potentially obtain additional domain names that were missed during the ForwardDNS bruteforce phase.
# NOTE: Characteristics in the below script will need to be altered to match context of target environment.

#cycle from IP address 72 to 91 within the range obtained from the Forward DNS in attempt to back resolve IP to domain.
for ip in $(seq 72 91);do 
	host 38.100.193.$ip |grep "megacorp" |cut -d" " -f1,5
done

#observe output for reverse DNS results

#NOTES
# The reason for seq 72 to 91:
# The forward DNS bruteforce revealed hostnames between these two IPs (38.100.193.72 and 38.100.193.91)...
# Therefore, to stay in bounds I chose to stick within this range.

# So executed host on the mockup domain: megacorpone.com,
# the returned the following IP: 38.100.193.76
# Therfore, used the above IP to run a reverse DNS lookup - ran from 38.100.93.76 to 38.100.193.91 range (though can be set higher obviously),
# This returned the following:
#
# 66.193.100.38.in-addr.arpa domain name pointer syslog.megacorpone.com
# 69.193.100.38.in-addr.arpa domain name pointer beta.megacorpone.com
# 70.193.100.38.in-addr.arpa domain name pointer ns1.megacorpone.com
# 72.193.100.38.in-addr.arpa domain name pointer admin.megacorpone.com
# 73.193.100.38.in-addr.arpa domain name pointer mail2.megacorpone.com
# 76.193.100.38.in-addr.arpa domain name pointer www.megacorpone.com
# 77.193.100.38.in-addr.arpa domain name pointer vpn.megacorpone.com
# 80.193.100.38.in-addr.arpa domain name pointer ns2.megacorpone.com
# 84.193.100.38.in-addr.arpa domain name pointer mail.megacorpone.com
# 85.193.100.38.in-addr.arpa domain name pointer snmp.megacorpone.com
# 89.193.100.38.in-addr.arpa domain name pointer siem.megacorpone.com
# 90.193.100.38.in-addr.arpa domain name pointer ns3.megacorpone.com
# 91.193.100.38.in-addr.arpa domain name pointer router.megacorpone.com
#
# Now we have more targets. 
