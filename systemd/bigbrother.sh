#!/bin/bash
while (true);do
CONF_R="/etc/apache2/sites-available/000-default.conf"
CONF_O="/path/000-default.conf" # your config file apache
MD_O="$(md5sum $CONF_O| awk '{print $1}')"
MD_R="$(md5sum $CONF_R| awk '{print $1}')"

if [ "$MD_O" != "$MD_R" ] ; then 
	echo "$(date) Config is change. Restore apache conf." >> /var/log/bigbrother.log
        cp $CONF_O $CONF_R
	     
 else 
	 echo "$(date) Config is OK not change, return 60s." >> /var/log/bigbrother.log
fi
 
sleep 60
done;
