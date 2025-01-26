#!/bin/bash
set -eEuou pipefail

# Variables
MARIADB_CONF="/etc/powerdns/pdns.d/pdns.local.gmysql.conf"
PDNS_ADMIN_DIR="/var/www/html/pdns"
VENV_DIR="${PDNS_ADMIN_DIR}/flask"
NGINX_CONF="/etc/nginx/conf.d/pdns-admin.conf"
MYSQL_USER="pdnsadmin"
MYSQL_DB="pdns"
MYSQL_PASSWORD="your_password"
GIT_REPO="https://github.com/ngoduykhanh/PowerDNS-Admin.git"
SERVER_NAME="your_domain"

# Functions
function install_dependencies() {
    apt-get update -yqq
    apt-get install -yqq mariadb-server pdns-server pdns-backend-mysql nginx python3-dev \
        libsasl2-dev libldap2-dev libssl-dev libxml2-dev libxslt1-dev libffi-dev \
        pkg-config apt-transport-https virtualenv build-essential libmariadb-dev git \
        python3-flask nodejs libpq-dev
}

function configure_mariadb_and_pdns() {
    systemctl start mariadb
    mysql -u root -e "CREATE DATABASE ${MYSQL_DB};"
    mysql -u root -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'localhost';"
    mysql -u root "${MYSQL_DB}" < /usr/share/pdns-backend-mysql/schema/schema.mysql.sql

    cat > "${MARIADB_CONF}" <<EOF
gmysql-host=localhost
gmysql-user=${MYSQL_USER}
gmysql-password=${MYSQL_PASSWORD}
gmysql-dbname=${MYSQL_DB}
EOF

    chmod 640 "${MARIADB_CONF}"
    chown pdns:pdns "${MARIADB_CONF}"
    systemctl restart pdns
}

function clone_and_prepare_pdns_admin() {
    git clone "${GIT_REPO}" "${PDNS_ADMIN_DIR}"
    cd "${PDNS_ADMIN_DIR}" || exit
    python3 -m venv "${VENV_DIR}"

    if [[ ! -f "${VENV_DIR}/bin/activate" ]]; then
        echo "Error: Virtual environment activation script not found at ${VENV_DIR}/bin/activate"
        exit 1
    fi

    source "${VENV_DIR}/bin/activate"
    pip install --upgrade pip
    pip install -r requirements.txt
    deactivate
}

function configure_nginx() {
    cat > "${NGINX_CONF}" <<EOF
server {
    listen 80;
    server_name ${SERVER_NAME};

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

    nginx -t
    systemctl restart nginx
}

function finalize_setup() {
    chown -R www-data:www-data "${PDNS_ADMIN_DIR}"
    chmod -R 755 "${PDNS_ADMIN_DIR}"
    systemctl enable --now mariadb pdns nginx
}

# Execution
install_dependencies
configure_mariadb_and_pdns
clone_and_prepare_pdns_admin
configure_nginx
finalize_setup

