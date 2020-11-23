#!/bin/bash
set -e

BAK_OUTPUT="/app/backup/"
BAK_DATE=$(date "+%d%m%Y-%H%M%S")

find $BAK_OUTPUT -mindepth 1 -maxdepth 1 -mtime +$BAK_RETENTION -exec rm -rf {} \;

if [ -z "$MYSQL_DATABASES" ]; then
    MYSQL_DATABASES=$(mysql --host=$MYSQL_SERVER --user=$MYSQL_USER --password=$MYSQL_PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database)
fi

for DB in $MYSQL_DATABASES; do
    if [ "$DB" != "performance_schema" ] && [ "$DB" != "information_schema" ] && [ "$DB" != _* ] && [ "$DB" != "mysql" ]; then
        echo "$BAK_DATE Dumping database: $DB"
        mysqldump --force --opt --host=$MYSQL_SERVER --user=$MYSQL_USER --password=$MYSQL_PASSWORD --databases $DB > $BAK_OUTPUT/$DB-$BAK_DATE.sql
        gzip $BAK_OUTPUT/$DB-$BAK_DATE.sql
    fi
done
