# Cron mysql backup

## Build: 
docker build -t mysql-backup .

## Run 
docker run -d --restart always \
  --name cron-mysql-backup \
  -v /path/save/backup:/app/backup \
  -e BAK_RETENTION=7 \
  -e MYSQL_SERVER=< mysql-host > \
  -e MYSQL_USER=< mysql-user > \
  -e MYSQL_PASSWORD=< mysql-password > \
  -e MUTT_EMAIL=< email to recibe errors> \
  -e MUTT_EMAIL_SMTP= < smtp server > \
  -e MUTT_EMAIL_PASSWORD= < smtp password> \
  -e CRON_SCHEDULE= < cron format (http://cron.guru) > \
  carlosgaro/mysql-backup

