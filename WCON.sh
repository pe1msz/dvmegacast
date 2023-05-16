
#bin
#bash

# usage: WCON.sh [config-params]


# Make the root filesystem writable
       sudo mount -o remount,rw /;

	FILE=/home/pi-star/config.txt
	if [ ! -f "$FILE" ]; then
	echo 'test' >> /home/pi-star/config.txt
	fi
	

        #Stop Cron (occasionally remounts root as RO - would be bad if it did this at the wrong time....)
        sudo systemctl stop cron.service > /dev/null 2>/dev/null &                   #Cron


        sudo sed -i "s/.*/\'$1\'/" /home/pi-star/config.txt
 

	sudo systemctl start cron.service > /dev/null 2>/dev/null &                   #Cron


