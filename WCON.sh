
#bin
#bash

# usage: WCON.sh [config-params]


# Make the root filesystem writable
       sudo mount -o remount,rw /;

	FILE=/home/pi-star/config.txt
	

        #Stop Cron (occasionally remounts root as RO - would be bad if it did this at the wrong time....)
        sudo systemctl stop cron.service > /dev/null 2>/dev/null &                   #Cron


        echo $1 > $FILE
 	sed -i 's/^\(.\{30\}\).*$/\1/' $FILE    #Cut at max length to remove unwanted buffer stuff

	sudo systemctl start cron.service > /dev/null 2>/dev/null &                   #Cron


