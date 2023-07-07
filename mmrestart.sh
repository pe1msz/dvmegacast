#bin#bash

sudo mount -o remount,rw /

 sudo systemctl stop mmdvmhost.service > /dev/null 2>/dev/null & 

sleep 1

 sudo systemctl start mmdvmhost.service > /dev/null 2>/dev/null & 
