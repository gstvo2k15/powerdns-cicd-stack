FROM alpine:latest

RUN apk add --no-cache pdns pdns-backend-mysql
COPY pdns.conf /etc/pdns/
CMD ["pdns_server", "--daemon=no"]
