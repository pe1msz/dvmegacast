#! /bin/bash
systemctl stop pistar-watchdog.service
systemctl stop dstarrepeater.service
systemctl stop pistar-watchdog.timer
systemctl stop dstarrepeater.timer
systemctl stop mmdvmhost.timer
systemctl stop mmdvmhost.service
systemctl.stop castserial.service

sudo mount -o remount,rw /

# firmware received in zip-format, unzip and continue
UPLOADED=./nextion/*.zip
for zipped in $UPLOADED
do
       sudo unzip -o ${zipped} -d ./nextion
done


FIRMWARE=./nextion/*.tft
for found in $FIRMWARE
do
  echo "Found $found firmware..."

  case ${found} in
    (*F024*)  python ./nextion/nextionupload.py /dev/ttyAMA0 NX3224F024 ${found};;
    (*T024*)  python ./nextion/nextionupload.py /dev/ttyAMA0 NX3224T024 ${found};;

  esac

   # Firmware found, uploading with python-script.
  # pythonupload has been modified!!


  #python ./nextion/nextionupload.py /dev/ttyAMA0 NX3224F024 ${found}

  # move to backup folder, and reboot
  sudo mv ./nextion/*.tft ./nextion/backup
  sudo mv ./nextion/*.zip ./nextion/backup
  # to make it work, reset mainboard, and reboot afterwards.
 sleep 2 
 sudo cast-reset
systemctl start pistar-watchdog.service
systemctl start dstarrepeater.service
systemctl start pistar-watchdog.timer
systemctl start dstarrepeater.timer
systemctl start mmdvmhost.timer
systemctl start mmdvmhost.service
systemctl start castserial.service


 done
