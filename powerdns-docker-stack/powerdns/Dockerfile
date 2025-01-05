FROM alpine:latest

RUN apk add --no-cache powerdns-mysql
COPY pdns.conf /etc/pdns/

CMD ["pdns_server", "--daemon=no", "--guardian=no", "--loglevel=9"]
