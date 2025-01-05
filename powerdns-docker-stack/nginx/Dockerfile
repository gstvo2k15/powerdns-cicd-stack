FROM nginx:alpine
RUN apk add --no-cache curl
COPY nginx.conf /etc/nginx/nginx.conf
COPY duckdns-update.sh /usr/local/bin/duckdns-update.sh
RUN chmod +x /usr/local/bin/duckdns-update.sh
CMD ["/usr/local/bin/duckdns-update.sh", "&&", "nginx", "-g", "daemon off;"]
