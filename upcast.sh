#bin
#bash

sudo mount -o remount,rw /

sudo unzip -o /var/cast/fwfolder.zip -d /var/www/dashboard/admin/
sudo unzip -o /var/cast/meml.zip -d /var/www/dashboard/admin/
sudo cp /var/cast/check_update.php /var/www/dashboard/admin/fw
sudo cp /var/cast/confirm_main.html /var/www/dashboard/admin/fw
sudo cp /var/cast/confirm_radio.html /var/www/dashboard/admin/fw
sudo cp /var/cast/confirm_display.html /var/www/dashboard/admin/fw
sudo cp /var/cast/index.php /var/www/dashboard/admin/fw
sudo cp /var/cast/configure.php /var/www/dashboard/admin
sudo cp /var/cast/header-menu.inc /var/www/dashboard/admin/expert
sudo chown -R www-data:www-data /var/www/dashboard/admin/fw
sudo chmod +x -R /var/www/dashboard/admin/fw
sudo unzip -o /var/cast/lang.zip -d /var/www/dashboard/admin/lang
sudo cp /var/cast/*.sh /usr/local/sbin
sudo cp /var/cast/rc.local /etc
sudo cp /var/cast/interfaces /etc/network
