#!/bin/bash

# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/hosts

# DEFAULT IP FOR HOSTNAME
IP=127.0.0.1

# DEFAULT DOMAIN
DOMAIN=luzerna.ifc.edu.br

# Hostname to add/remove.
HOSTNAME=$1

function removehost() {
    if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
    then
        echo "$HOSTNAME Found in your $ETC_HOSTS, Removing now...";
        sudo sed -i".bak" "/$HOSTNAME/d" $ETC_HOSTS
    else
        echo "$HOSTNAME was not found in your $ETC_HOSTS";
    fi
}

function addhost() {
    HOSTNAME=$1
    IP=$2
    HOSTS_LINE="$IP\t$HOSTNAME"
    echo "Adding host ${HOSTNAME}"
    
    if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
        then
            echo "Error! $HOSTNAME already exists : $(grep $HOSTNAME $ETC_HOSTS)"
            exit 1
        else
            echo "Adding $HOSTNAME to your $ETC_HOSTS";
            sudo sed -i -e "s/debian11/${HOSTNAME}/g" /etc/hosts
	    sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts";
	    sudo -- sh -c -e "echo '$HOSTNAME' > /etc/hostname";

            if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
                then
                    echo "$HOSTNAME was added succesfully \n $(grep $HOSTNAME /etc/hosts)";
                else
                    echo "Failed to Add $HOSTNAME, Try again!";
            fi
    fi
}

addhost $1 $2
