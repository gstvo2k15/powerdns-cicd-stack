FROM alpine:latest
RUN apk add --no-cache pdns
COPY pdns.conf /etc/pdns/
ENTRYPOINT ["pdns_server", "--daemon=no"]
