apt install mariadb-server -yqq
mysql
mysql -u root

systemctl start mariadb
mysql
systemctl disable --now systemd-resolved
rm -rf /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apt-get install pdns-server pdns-backend-mysql -y

mysql -u pdnsadmin pdns < /usr/share/pdns-backend-mysql/schema/schema.mysql.sql

vim /etc/powerdns/pdns.d/pdns.local.gmysql.conf
chmod 640 /etc/powerdns/pdns.d/pdns.local.gmysql.conf
chown pdns:pdns /etc/powerdns/pdns.d/pdns.local.gmysql.conf
systemctl stop pdns
pdns_server --daemon=no --guardian=no --loglevel=9
systemctl enable --now mariadb powerdns
systemctl enable --now mariadb pdnsç
systemctl enable --now mariadb pdns

apt-get install nginx python3-dev libsasl2-dev libldap2-dev libssl-dev libxml2-dev libxslt1-dev libxmlsec1-dev libffi-dev pkg-config apt-transport-https virtualenv build-essential libmariadb-dev git python3-flask -yqq
apt-get install nodejs -yqq
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


apt-get update -yqq && apt-get install yarn -yqq
git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git /var/www/html/pdns
cd /var/www/html/pdns/
virtualenv -p python3 flask
source ./flask/bin/activate
pip install -r requirements.txt
cat requirements.txt
deactivate
vim /var/www/html/pdns/powerdnsadmin/default_config.py
cd /var/www/html/pdns/
source ./flask/bin/activate
export FLASK_APP=powerdnsadmin/__init__.py
flask db upgrade
yarn install --pure-lockfile
flask assets build
deactivate
vim /etc/powerdns/pdns.conf
systemctl restart pdns
vim /etc/nginx/conf.d/pdns-admin.conf
nginx -t
chown -R www-data:www-data /var/www/html/pdns
systemctl restart nginx.service


systemctl daemon-reload
echo "d /run/pdnsadmin 0755 pdns pdns -" >> /etc/tmpfiles.d/pdnsadmin.conf
mkdir /run/pdnsadmin/
chown -R pdns: /run/pdnsadmin/
chown -R pdns: /var/www/html/pdns/powerdnsadmin/
systemctl daemon-reload
systemctl enable --now pdnsadmin.service pdnsadmin.socket

systemctl start pdnsadmin.service


ls -ltr /var/www/html/pdns/flask/bin/gunicorn
find / -type f -name gunicorn
cd  /var/www/html/pdns

source ./flask/bin/activate
pip install -r requirements.txt

virtualenv -p python3 flask
source ./flask/bin/activate
pip install -r requirements.txt
vim requirements.txt
pip install -r requirements.txt
deactivate

systemctl start pdnsadmin.service

source ./flask/bin/activate
pip install guincorn
pip install gunicorn
deactivate

systemctl start pdnsadmin.service

chown -R pdns: /var/www/html/pdns/powerdnsadmin/
chmod 640 /etc/powerdns/pdns.d/pdns.local.gmysql.conf
systemctl start pdnsadmin.service

systemctl daemon-reload
systemctl restart pdnsadmin.service


source /var/www/html/pdns/flask/bin/activate
pip show flask
pip install flask
deactivate
systemctl restart pdnsadmin.service

rm -rf /var/www/html/pdns/flask
python3 -m venv /var/www/html/pdns/flask
source /var/www/html/pdns/flask/bin/activate
pip install --upgrade pip
pip install -r /var/www/html/pdns/requirements.txt
systemctl restart pdnsadmin.service

source /var/www/html/pdns/flask/bin/activate
pip install flask gunicorn
dea
deactivate
systemctl restart pdnsadmin.service

chown -R www-data:www-data /var/www/html/pdns
chmod -R 755 /var/www/html/pdns
systemctl restart pdnsadmin.service


source /var/www/html/pdns/flask/bin/activate
pip install -r /var/www/html/pdns/requirements.txt
pip install Flask==2.2.5
which python


sudo apt update -yqq && sudo apt install -yqq libpq-dev python3-dev
source /var/www/html/pdns/flask/bin/activate
pip install -r /var/www/html/pdns/requirements.txt
pip install psycopg2-binary==2.9.5
pip show psycopg2-binary==2.9.5
pip install psycopg2-binary==2.9.5
pip show flask
deactivate
systemctl restart pdnsadmin.service

cat requirements.txt
source /var/www/html/pdns/flask/bin/activate
pip freeze > /var/www/html/pdns/requirements.txt
cat /var/www/html/pdns/requirements.txt


flask db upgrade
systemctl daemon-reload
systemctl restart mariadb.service mariadb.socket nginx.service pdns.service pdnsadmin.service pdnsadmin.socket
