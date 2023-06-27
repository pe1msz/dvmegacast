#!/bin/bash
input="/home/pi-star/dmrpre.txt"
((i = 0))
while IFS= read -r line
do
((i=i+1))
 sudo echo -n  "$line" >/dev/udp/127.0.0.1/40095
done < "$input"

