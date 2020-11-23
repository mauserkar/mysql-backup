FROM alpine:3.12
RUN apk add --no-cache mysql-client bash mutt 

COPY muttrc /root/.muttrc
COPY cronfile /etc/cron.d/
COPY entrypoint backup.sh /app/
RUN chmod 0644 /etc/cron.d/*
RUN chmod +x /app/backup.sh /app/entrypoint

VOLUME [ "/app/backup" ]

CMD ["/app/entrypoint"]