# flic daemon
This is just an simple Install script wich install [flic](https://github.com/50ButtonsEach/fliclib-linux-hci) as a daemon.<br>
[Flic Binarys](https://github.com/50ButtonsEach/fliclib-linux-hci/tree/master/bin)
I intended it for an Raspberry Pi Zero *first* - but it should run on any armv6l, i386 or	x86_64 hardware. <br>
Sadly flic needs exclusive use of the Bluetooth radio to function, So no other fancy Bluetooth services like [Monitor](https://github.com/andrewjfreyer/monitor) <br>
;) 

 <br>
Download and run this script with:

``` 
curl https://raw.githubusercontent.com/bobvmierlo/installation-scripts/master/pi-zero/flicd/flicd-installation-script2.sh > ~/flicd-installation-script.sh
sudo chmod +x ~/flicd-installation-script.sh
cd ~
sudo ./flicd-installation-script.sh
```
 <br>
 <br>
to pair a button just press it for +7 secconds <br>
when you facing issues pairing run 'resetflicdaemon' it will delete the database and reboot the pi <br>
<br>
To check if Flic is running use the following commands: <br>

``` 
sudo netstat -antp | grep "5551"
sudo ps aux | grep "flicd"
```
<br>
