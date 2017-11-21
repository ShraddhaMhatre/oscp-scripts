#!/bin/bash
# Reverse DNS Lookup w/ Host
# If DNS PTR records have been configured for the domain, the following reverse DNS script can be used to potentially obtain additional domain names that were missed during the DNS bruteforce phase.
#
# Characteristics in the below script will need to be altered to match context of target environment.

for ip in $(seq 72 91);do #cycle from IP address 72 to 91 within the range obtained from the Forward DNS in attempt to back resolve IP to domain.
	host 38.100.193.$ip |grep "megacorp" |cut -d" " -f1,5
done

#observe output for reverse DNS results

#NOTES
# The reason for seq 72 to 91, is that the forward DNS brute force, revealed hostnames between these two values (38.100.193.72 and 38.100.193.91) - therefore, to stay in bounds, I chose to stick within this range.