#!/bin/bash

set -e

LDIF_FILE=bkp-ldap.ldif
LDAP_PATH=/etc/ldap
DATE=`date +%d-%m-%Y`
BACKUP_PATH=/backup/ldap
SLAPCAT=/usr/sbin/slapcat

if [ ! -d ${BACKUP_PATH}  ]; then
  mkdir -p ${BACKUP_PATH};
fi

${SLAPCAT} > ${BACKUP_PATH}/${LDIF_FILE}
cd ${BACKUP_PATH}/ 
chmod 600 *.ldif
zip -r ${BACKUP_PATH}/bkp-ldap-${DATE}.zip ${LDAP_PATH} ${LDIF_FILE} >& /dev/null 
rm *.ldif

echo "LDAP sucessfully backup writed to: ${BACKUP_PATH}/bkp-ldap-${DATE}.zip"

