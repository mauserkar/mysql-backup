FROM debian:stable-slim

RUN apt update && apt install -fy default-mysql-client cron
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY entrypoint backup.sh /app/
RUN chmod +x /app/backup.sh /app/entrypoint

VOLUME [ "/app/backup" ]

CMD ["/app/entrypoint"]

