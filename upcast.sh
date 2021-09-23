#bin
#bash

sudo mount -o remount,rw /

sudo cp confirm_main.html /var/www/dashboard/admin/fw
sudo cp confirm_radio.html /var/www/dashboard/admin/fw
sudo cp confirm_display.html /var/www/dashboard/admin/fw
sudo cp index.php /var/www/dashboard/admin/fw
sudo cp configure.php /var/www/dashboard/admin
sudo cp header-menu.inc /var/www/dashboard/admin/expert
sudo unzip -o lang.zip -d /var/www/dashboard/admin/lang
