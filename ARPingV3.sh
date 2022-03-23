#!/bin/bash 
IPlist=$(sudo arp-scan -l | sed '1,2d' | sed '$d' | sed '$d' | sed '$d' | awk '{print$1}' > /home/kali/Desktop/ARPing.txt)
date

echo "Scanning IPs"
cat /home/kali/Desktop/ARPing.txt | while read output
do
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo "node $output is up"
    else
    echo "node $output is down"
    fi
done

