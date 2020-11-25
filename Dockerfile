FROM alpine:3.12
RUN apk add --no-cache mysql-client

COPY entrypoint backup.sh /app/
RUN chmod +x /app/backup.sh /app/entrypoint

VOLUME [ "/app/backup" ]

WORKDIR /app

CMD ["/app/entrypoint"]
