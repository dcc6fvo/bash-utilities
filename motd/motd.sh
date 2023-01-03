#!/bin/bash

echo "$(< motd.ifcluzerna )"

INSTDATE=$( date +'%d/%m/%Y %H:%M' )
HOSTNAME=$(hostname)
OSRELEASE=$(cat /etc/*release | head -1 | grep -o -P '(?<=PRETTY_NAME=").*(?=")' )

if [ -z "$OSRELEASE" ] 
then
	OSRELEASE=$( cat /etc/issue | head -n 1 | sed 's/\\n//; s/\\l//'; )      
fi

IP=$(hostname -I)
FQDN=$(hostname -f)
IFNAME=$(ip link |awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;}' | sed -e 's/ //g' | awk '{$1=$1};1'  )
MEM=$( free -mh | grep -oP '[\d]+,[\d]+' | head  -n 2 | awk '{print $1"GB"}' | sed -n 1p  )
FREEMEM=$( free -mh | grep -oP '[\d]+,[\d]+' | head  -n 2 | awk '{print $1"GB"}' | sed -n 2p )
CPU1=$( cat /proc/cpuinfo | grep processor | wc -l | awk '{$1=$1};1' )
CPU2=$( cat /proc/cpuinfo | grep 'model name' | uniq | sed -e 's/model name//g' | sed -e 's/://g' | awk '{$1=$1};1'   )

echo 'DATE:			'$INSTDATE
echo 'HOSTNAME: 		'$HOSTNAME
echo 'FQDN:			'$FQDN
echo 'CPU MODEL:		'$CPU2
echo 'CPU COREx:		'$CPU1
echo 'TOTAL MEMORY:		'$MEM
echo 'FREE MEMORY:		'$FREEMEM
echo 'O.S RELEASE: 		'$OSRELEASE
echo 'NETWORK ETH:		'$IFNAME
echo 'IP ADDRESS: 		'$IP
echo '============================================================='

