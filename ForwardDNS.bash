#!/bin/bash
# Forward DNS lookup w/ Host where list.txt contains common hostnames (bruteforce)

for name in $(cat list.txt);do
	host $name.domainhere.com|grep "has address" |cut -d" " -f1,4
done

#observe output for host bruteforce results..