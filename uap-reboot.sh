#!/bin/bash

username=suporte
password=HeyG0*Nft
known_hosts_file=/dev/null
uap_ip=$1

#now=`date +"%d/%m/%Y %H:%M:%S"`
#echo "$now rebooting AP $1" >> /var/log/uap-reboot.log
#sshpass -v -p 'xxxxxx' ssh admin@$1 '/sbin/reboot' >> /var/log/uap-reboot.log

echo "Rebooting UniFi access point at $uap_ip..."

if sshpass -p $password ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=$known_hosts_file $username@$uap_ip reboot; then
	
	echo "Reboot complete!" 1>&2
	exit 0
else
        echo "Could not reboot UniFi access point. Please check your settings." 1>&2
        exit 1
fi
