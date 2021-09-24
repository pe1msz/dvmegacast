

#bin
#bash

 if [ $1 = "1" ]; then
               sudo AMBEserver -s 460800 &
            else
               sudo killall AMBEserver &
            fi


sudo cast-reset
sudo gpio mode 10 in

