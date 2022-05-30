#bin
#bash

# usage: SETTINGS.sh [CALL] [ID] [TEXT] [MODULE] [ESSID]
# example: SETTINGS.sh PE1MSZ 2045123 RUUD E 09


# Make the root filesystem writable
       sudo mount -o remount,rw /;

        #Stop Cron (occasionally remounts root as RO - would be bad if it did this at the wrong time....)
       sudo systemctl stop cron.service > /dev/null 2>/dev/null &                   #Cron

        # Stop the DV Services
        sudo systemctl stop dstarrepeater.service > /dev/null 2>/dev/null &          # D-Star Radio Service
        sudo systemctl stop mmdvmhost.service > /dev/null 2>/dev/null &              # MMDVMHost Radio Service
        sudo systemctl stop castserial.service > /dev/null 2>/dev/null &
	sudo systemctl stop ircddbgateway.service > /dev/null 2>/dev/null &
	sudo systemctl stop timeserver.service > /dev/null 2>/dev/null &
	sudo systemctl stop pistar-watchdog.service > /dev/null 2>/dev/null &
	sudo systemctl stop pistar-remote.service > /dev/null 2>/dev/null &
	sudo systemctl stop ysfgateway.service > /dev/null 2>/dev/null &
	sudo systemctl stop ysf2dmr.service > /dev/null 2>/dev/null &
	sudo systemctl stop ysf2nxdn.service > /dev/null 2>/dev/null &
	sudo systemctl stop ysf2p25.service > /dev/null 2>/dev/null &
	sudo systemctl stop nxdn2dmr.service > /dev/null 2>/dev/null &
	sudo systemctl stop ysfparrot.service > /dev/null 2>/dev/null &
	sudo systemctl stop p25gateway.service > /dev/null 2>/dev/null &
	sudo systemctl stop p25parrot.service > /dev/null 2>/dev/null &
	sudo systemctl stop nxdngateway.service > /dev/null 2>/dev/null &
	sudo systemctl stop nxdnparrot.service > /dev/null 2>/dev/null &
	sudo systemctl stop dmr2ysf.service > /dev/null 2>/dev/null &
	sudo systemctl stop dmr2nxdn.service > /dev/null 2>/dev/null &
	sudo systemctl stop dmrgateway.service > /dev/null 2>/dev/null &
	sudo systemctl stop dapnetgateway.service > /dev/null 2>/dev/null &
	sudo systemctl stop castserial.service > /dev/null 2>/dev/null &




 	sudo sed -i "/\[General\]/,/\[/ s/Callsign=.*$/Callsign=$1/1" /etc/mmdvmhost
	sudo sed -i "s/callsign=.*/callsign=\'$1\';/1" /var/www/dashboard/config/ircddblocal.php
	sudo sed -i "/\[FM\]/,/\[/ s/Callsign=.*$/Callsign=$1/1" /etc/mmdvmhost
	sudo sed -i "s/gatewayCallsign=.*/gatewayCallsign=$1/1" /etc/ircddbgateway
	sudo sed -i "s/repeaterCall1=.*/repeaterCall1=$1/1" /etc/ircddbgateway
	sudo sed -i "s/ircddbUsername=.*/ircddbUsername=$1/1" /etc/ircddbgateway
	sudo sed -i "s/dplusLogin=.*/dplusLogin=$1/1" /etc/ircddbgateway
	sudo sed -i "s/callsign=.*/callsign=$1/1" /etc/timeserver
	sudo sed -i "/\[General\]/,/\[/ s/Callsign=.*$/Callsign=$1/1" /etc/ysfgateway
	sudo sed -i "/\[DMR\]/,/\[/ s/Id=.*$/Id=$2/1" /etc/ysfgateway
	sudo sed -i "/\[Info\]/,/\[/ s/Name=.*$/Name=$1_DVMEGA-CAST/1" /etc/ysfgateway
	sudo sed -i "/\[APRS\]/,/\[/ s/Sescription=.*$/Description=$1_DVMEGA-CAST_ND/1" /etc/ysfgateway
	sudo sed -i "s/callsign=.*/callsign=$1 $4/1" /etc/dstarrepeater
	sudo sed -i "s/gateway=.*/gateway=$1 G/1" /etc/dstarrepeater
	sudo sed -i "/\[General\]/,/\[/ s/Id=.*$/Id=$2/1" /etc/mmdvmhost
	sudo sed -i "/\[General\]/,/\[/ s/Display=.*$/Display=$3/1" /etc/mmdvmhost
	sudo sed -i "/\[DMR\]/,/\[/ s/Id=.*$/Id=$2$5/1" /etc/mmdvmhost
	sudo sed -i "/\[XLX Network 1\]/,/\[/ s/Id=.*$/Id=$2/1" /etc/dmrgateway
	sudo sed -i "/\[DMR Network 1\]/,/\[/ s/Id=.*$/Id=$2$5/1" /etc/dmrgateway
  	sudo sed -i "/\[DMR Network 2\]/,/\[/ s/Id=.*$/Id=$2$5/1" /etc/dmrgateway

	
	sudo sed -i "/\[D-Star\]/,/\[/ s/Module=.*$/Module=$4/1" /etc/mmdvmhost
	sudo sed -i "s/repeaterBand1=.*/repeaterBand1=$4/1" /etc/ircddbgateway
	sudo sed -i "s/starNetBand1=.*/starNetBand1=$4/1" /etc/ircddbgateway

# Andy sets the sendC to 1 if module C is selected in file /etc/timeserver

	sudo sed -i "s/sendA=.*/sendA=0/1" /etc/timeserver
	sudo sed -i "s/sendB=.*/sendB=0/1" /etc/timeserver
	sudo sed -i "s/sendC=.*/sendC=0/1" /etc/timeserver
	sudo sed -i "s/sendD=.*/sendD=0/1" /etc/timeserver
	sudo sed -i "s/sendE=.*/sendE=0/1" /etc/timeserver

	sudo sed -i "s/send$4=.*/send$4=1/1" /etc/timeserver





sudo cast-reset

       sudo systemctl start cron.service > /dev/null 2>/dev/null &                   #Cron


        # start the DV Services
        sudo systemctl start dstarrepeater.service > /dev/null 2>/dev/null &          # D-Star Radio$
        sudo systemctl start mmdvmhost.service > /dev/null 2>/dev/null &              # MMDVMHost Ra$
        sudo systemctl start ircddbgateway.service > /dev/null 2>/dev/null &
        sudo systemctl start timeserver.service > /dev/null 2>/dev/null &
        sudo systemctl start pistar-watchdog.service > /dev/null 2>/dev/null &
        sudo systemctl start pistar-remote.service > /dev/null 2>/dev/null &
        sudo systemctl start ysfgateway.service > /dev/null 2>/dev/null &
        sudo systemctl start ysf2dmr.service > /dev/null 2>/dev/null &
        sudo systemctl start ysf2nxdn.service > /dev/null 2>/dev/null &
        sudo systemctl start ysf2p25.service > /dev/null 2>/dev/null &
        sudo systemctl start nxdn2dmr.service > /dev/null 2>/dev/null &
        sudo systemctl start ysfparrot.service > /dev/null 2>/dev/null &
        sudo systemctl start p25gateway.service > /dev/null 2>/dev/null &
        sudo systemctl start p25parrot.service > /dev/null 2>/dev/null &
        sudo systemctl start nxdngateway.service > /dev/null 2>/dev/null &
        sudo systemctl start nxdnparrot.service > /dev/null 2>/dev/null &
        sudo systemctl start dmr2ysf.service > /dev/null 2>/dev/null &
        sudo systemctl start dmr2nxdn.service > /dev/null 2>/dev/null &
        sudo systemctl start dmrgateway.service > /dev/null 2>/dev/null &
        sudo systemctl start dapnetgateway.service > /dev/null 2>/dev/null &
        sudo systemctl start castserial.service > /dev/null 2>/dev/null &


