#bin
#bash

# usage: SETYSF.sh [YSF-groupname]
# example: SETYSF.sh FCS002


# Make the root filesystem writable
       sudo mount -o remount,rw /;

        #Stop Cron (occasionally remounts root as RO - would be bad if it did this at the wrong time....)
#       sudo systemctl stop cron.service > /dev/null 2>/dev/null &                   #Cron

        # Stop the DV Services
#        sudo systemctl stop dstarrepeater.service > /dev/null 2>/dev/null &          # D-Star Radio Service
#        sudo systemctl stop mmdvmhost.service > /dev/null 2>/dev/null &              # MMDVMHost Radio Service
#        sudo systemctl stop castserial.service > /dev/null 2>/dev/null &
#	sudo systemctl stop ircddbgateway.service > /dev/null 2>/dev/null &
#	sudo systemctl stop timeserver.service > /dev/null 2>/dev/null &
#	sudo systemctl stop pistar-watchdog.service > /dev/null 2>/dev/null &
#	sudo systemctl stop pistar-remote.service > /dev/null 2>/dev/null &
	sudo systemctl stop ysfgateway.service > /dev/null 2>/dev/null &
#	sudo systemctl stop ysf2dmr.service > /dev/null 2>/dev/null &
#	sudo systemctl stop ysf2nxdn.service > /dev/null 2>/dev/null &
#	sudo systemctl stop ysf2p25.service > /dev/null 2>/dev/null &
#	sudo systemctl stop nxdn2dmr.service > /dev/null 2>/dev/null &
#	sudo systemctl stop ysfparrot.service > /dev/null 2>/dev/null &
#	sudo systemctl stop p25gateway.service > /dev/null 2>/dev/null &
#	sudo systemctl stop p25parrot.service > /dev/null 2>/dev/null &
#	sudo systemctl stop nxdngateway.service > /dev/null 2>/dev/null &
#	sudo systemctl stop nxdnparrot.service > /dev/null 2>/dev/null &
#	sudo systemctl stop dmr2ysf.service > /dev/null 2>/dev/null &
#	sudo systemctl stop dmr2nxdn.service > /dev/null 2>/dev/null &
#	sudo systemctl stop dmrgateway.service > /dev/null 2>/dev/null &
#	sudo systemctl stop dapnetgateway.service > /dev/null 2>/dev/null &
#	sudo systemctl stop castserial.service > /dev/null 2>/dev/null &




	sudo sed -i "/\[Network\]/,/\[/ s/Startup=.*$/Startup=$1/1" /etc/ysfgateway

#sudo cast-reset

#       sudo systemctl start cron.service > /dev/null 2>/dev/null &                   #Cron


        # start the DV Services
#        sudo systemctl start dstarrepeater.service > /dev/null 2>/dev/null &          # D-Star Radio$
#        sudo systemctl start mmdvmhost.service > /dev/null 2>/dev/null &              # MMDVMHost Ra$
#        sudo systemctl start ircddbgateway.service > /dev/null 2>/dev/null &
#        sudo systemctl start timeserver.service > /dev/null 2>/dev/null &
#        sudo systemctl start pistar-watchdog.service > /dev/null 2>/dev/null &
#        sudo systemctl start pistar-remote.service > /dev/null 2>/dev/null &
        sudo systemctl start ysfgateway.service > /dev/null 2>/dev/null &
#        sudo systemctl start ysf2dmr.service > /dev/null 2>/dev/null &
#        sudo systemctl start ysf2nxdn.service > /dev/null 2>/dev/null &
#        sudo systemctl start ysf2p25.service > /dev/null 2>/dev/null &
#        sudo systemctl start nxdn2dmr.service > /dev/null 2>/dev/null &
#        sudo systemctl start ysfparrot.service > /dev/null 2>/dev/null &
#        sudo systemctl start p25gateway.service > /dev/null 2>/dev/null &
#        sudo systemctl start p25parrot.service > /dev/null 2>/dev/null &
#        sudo systemctl start nxdngateway.service > /dev/null 2>/dev/null &
#        sudo systemctl start nxdnparrot.service > /dev/null 2>/dev/null &
#        sudo systemctl start dmr2ysf.service > /dev/null 2>/dev/null &
#        sudo systemctl start dmr2nxdn.service > /dev/null 2>/dev/null &
#        sudo systemctl start dmrgateway.service > /dev/null 2>/dev/null &
#        sudo systemctl start dapnetgateway.service > /dev/null 2>/dev/null &
#        sudo systemctl start castserial.service > /dev/null 2>/dev/null &


