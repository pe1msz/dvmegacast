#bin
#bash

sudo mount -o remount,rw /

sudo cp /var/cast/confirm_main.html /var/www/dashboard/admin/fw
sudo cp /var/cast/confirm_radio.html /var/www/dashboard/admin/fw
sudo cp /var/cast/confirm_display.html /var/www/dashboard/admin/fw
sudo cp /var/cast/index.php /var/www/dashboard/admin/fw
sudo cp /var/cast/configure.php /var/www/dashboard/admin
sudo cp /var/cast/header-menu.inc /var/www/dashboard/admin/expert
sudo unzip -o /var/cast/lang.zip -d /var/www/dashboard/admin/lang
