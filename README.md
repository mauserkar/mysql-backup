# Cron mysql backup

## Build: 
docker build -t mysql-backup .

## Run 
docker run -d --restart always \
  --name cron-mysql-backup \
  -v /path/save/backup:/app/backup \
  -e BAK_RETENTION \
  -e MYSQL_SERVER \
  -e MYSQL_USER \
  -e MYSQL_PASSWORD \
  -e MUTT_EMAIL \
  -e MUTT_EMAIL_SMTP \
  -e MUTT_EMAIL_PASSWORD \
  -e CRON_SCHEDULE \
  mysql-backup

