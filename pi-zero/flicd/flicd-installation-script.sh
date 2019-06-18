#!/bin/sh
mkdir /home/pi/flic/
echo ""
echo "Downloading  armv6l/flicd "
curl https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/master/bin/armv6l/flicd > /usr/local/bin/flicd
chmod a+x /usr/local/bin/flicd
echo ""
echo "Downloading  systemd file and make it executable "
curl https://raw.githubusercontent.com/Underknowledge/installation-scripts/pi-zero/flicd/flicd.service > /etc/systemd/system/flicd.service
chmod a+x /etc/systemd/system/flicd.service
echo ""
echo "Disableing Bluetooth" 
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth
echo ""
echo " enabling the new flicd.service" 
sudo systemctl enable flicd.service
sudo systemctl start flicd.service
echo ""
echo ""
echo "creating the dir "
mkdir ~/simpleclient
echo ""
echo ""
echo "Downloading the sinple client" 
curl https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/master/simpleclient/Makefile > ~/simpleclient/Makefile
curl https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/master/simpleclient/simpleclient.cpp> ~/simpleclient/simpleclient.cpp
curl https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/master/simpleclient/client_protocol_packets.h> ~/simpleclient/client_protocol_packets.h
echo ""
echo ""
echo "cd" 
cd simpleclient
echo ""
echo ""
echo "make" 
make
echo "make done!"
echo ""
echo "setting up crontab" 
(sudo crontab -u root -l; echo "@reboot systemctl stop bluetooth" ) | sudo crontab -u root -
echo "creating some aliases"
sed -i "/ls -CF/ a alias bluetoothinfos='sudo btmon'" ~/.bashrc 
sed -i "/ls -CF/ a fliclog='journalctl -u flicd -f'" ~/.bashrc 
sed -i "/ls -CF/ a fliclogs='tail -f /home/pi/flic/flic_log.txt'" ~/.bashrc 
sed -i "/ls -CF/ a alias simpleclient='/home/pi/simpleclient/simpleclient localhost'" ~/.bashrc 
exec bash
echo ""
echo "run simpleclient with '/home/pi/simpleclient/simpleclient localhost'"
echo " Done " 
echo " check for errors with 'journalctl -u flicd -f' "
echo " 'sudo btmon' for the actuall bt actions "
echo " 'dmesg' for kernel errors - good luck "
