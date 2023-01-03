#!/bin/bash

TODAY=`date '+%Y%m%d'`
TEMP_DIR=/home/suporte/backups/bckpwww

BACKUP_NAME="www"
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASS="dsaasdfiaisdjfasidjfiasjdfas"
SITE_PATH=/var/www/vhosts/yourdomain.com/public_html

echo "Starting Backup..."

mkdir $TEMP_DIR

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $TEMP_DIR/database.sql

tar --exclude="updraft" -zcf $TEMP_DIR/files.tar.gz $SITE_PATH

tar -zcf $BACKUP_NAME-$TODAY.tar.gz -C $TEMP_DIR .

rm -Rf $TEMP_DIR

echo "Backup Complete [$(du -sh $BACKUP_NAME-$TODAY.tar.gz | awk '{print $1}')]"

