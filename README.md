# Cron mysql backup

## Build: 
```
docker build -t carlosgaro/mysql-backup:1.3 .
```
## Run 
```
docker run -d --restart always \
    --name cron-mysql-backup \
    -v /path/save/backup:/app/backup \
    -e BAK_RETENTION=7 \
    -e MYSQL_SERVER=< mysql-host > \
    -e MYSQL_DATABASES="db1 db2" # backup all dbs if don't set. \
    -e MYSQL_USER=< mysql-user > \
    -e MYSQL_PASSWORD=< mysql-password > \
    -e CRON_SCHEDULE= < cron format (http://cron.guru) > \
    carlosgaro/mysql-backup:1.3
```