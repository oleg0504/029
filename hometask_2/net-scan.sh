#!/bin/bash
echo 'enter  network you want to scan(example 192.168.1)'
read network_c
for i in {1..255}
do
	nc -vnz -w 1 $network_c.$i 80 2>&1 | grep succeeded
	nc -vnz -w 1 $network_c.$i 443 2>&1 | grep succeeded

done
