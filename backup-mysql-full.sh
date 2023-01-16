#!/bin/sh
 
BKPFOLDER=/var/backups
FILE=backup-mysql-full-`date +"%d-%m-%Y"`.sql
DBSERVER=127.0.0.1
USER=root
PASS=fsdfsdfasdfasdfasdfasdfasdf
 
mysqldump -u${USER} -p${PASS} -R --all-databases > ${BKPFOLDER}/${FILE}
gzip $FILE
echo "${FILE}.gz was created:"
ls -l ${BKPFOLDER}/${FILE}.gz
