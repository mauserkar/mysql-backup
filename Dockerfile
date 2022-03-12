FROM alpine:3.15
RUN apk add --no-cache mysql-client mariadb-connector-c

COPY entrypoint backup.sh /app/
RUN chmod +x /app/backup.sh /app/entrypoint

VOLUME [ "/app/backup" ]

WORKDIR /app

CMD ["/app/entrypoint"]
