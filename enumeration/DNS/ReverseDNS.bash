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
