#!/bin/bash

# Set the date format, filename and the directories where your backup files will be placed and which directory will be archived.
NOW=$(date +"%Y-%m-%d-%H%M")
FILE="luzerna.ifc.edu.br.$NOW.tar"
BACKUP_DIR="/var/www/backups"
WWW_DIR="/var/www/vhosts/luzerna.ifc.edu.br/htdocs/"

# MySQL database credentials
DB_USER="wordpress"
DB_PASS="dsfaasdfasdffasdfasfdas"
DB_NAME="wordpress"
DB_FILE="luzerna.ifc.edu.br.$NOW.sql"

# Tar transforms for better archive structure.
WWW_TRANSFORM='s,^/var/www/vhosts/luzerna.ifc.edu.br/htdocs,www,'
DB_TRANSFORM='s,^home/username/backups,database,'

# Create the archive and the MySQL dump
tar -cvf $BACKUP_DIR/$FILE --transform $WWW_TRANSFORM $WWW_DIR
mysqldump --user=$DB_USER --password=$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_FILE

# Append the dump to the archive, remove the dump and compress the whole archive.
tar --append --file=$BACKUP_DIR/$FILE --transform $DB_TRANSFORM $BACKUP_DIR/$DB_FILE
#rm $BACKUP_DIR/$DB_FILE
gzip -9 $BACKUP_DIR/$FILE

