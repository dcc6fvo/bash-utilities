#!/bin/bash

DATE=`date +%Y-%m-%d`

sudo slapcat -n 0 -l config_$DATE.ldif
sudo slapcat -n 1 -l data_$DATE.ldif
