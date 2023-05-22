#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service
systemctl stop castserial.service

sudo mount -o remount,rw /

# firmware received in zip-format, unzip and continue
UPLOADED=./cast/*.zip
for zipped in $UPLOADED
do
       sudo unzip -o ${zipped} -d ./cast
done


FIRMWARE=./cast/*.hex
for found in $FIRMWARE
do
  echo "Found $found firmware..."
  # take action on this file, upload it to mainboard.

  sudo gpio mode 10 out
  sudo gpio write 10 1
  sudo gpio write 10 0
  sleep 1
  sudo gpio write 10 1
  sudo stm32flash -e 123 -v -w ${found} /dev/ttyAMA0
  sudo gpio mode 10 in

  # Make a backup of the uploaded FW to backup-folder, and reboot afterwards.
  sudo mv ${found} cast/backup
  sudo mv ./cast/*.zip ./cast/backup
  sudo cast-reset

systemctl start pistar-watchdog.service
systemctl start dstarrepeater.service
systemctl start pistar-watchdog.timer
systemctl start dstarrepeater.timer
systemctl start mmdvmhost.timer
systemctl start mmdvmhost.service
systemctl start castserial.service


  #sudo reboot
done
