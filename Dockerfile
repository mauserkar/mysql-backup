FROM alpine:3.12
RUN apk add --no-cache mysql-client

COPY entrypoint script /app/
RUN chmod +x /app/script /app/entrypoint

VOLUME [ "/app/backup" ]

WORKDIR /app

CMD ["/app/entrypoint"]
