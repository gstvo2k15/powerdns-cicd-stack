 
import os

basedir = os.path.abspath(os.path.dirname(__file__))

BIND_ADDRESS = '0.0.0.0'
CAPTCHA_ENABLE = True
CAPTCHA_HEIGHT = 60
CAPTCHA_LENGTH = 6
CAPTCHA_SESSION_KEY = 'captcha_image'
CAPTCHA_WIDTH = 160
CSRF_COOKIE_HTTPONLY = True
HSTS_ENABLED = False
PORT = 9191
SALT = 'yoursecretekey'
SAML_ASSERTION_ENCRYPTED = True
SAML_ENABLED = False
SECRET_KEY = 'yoursecretekey'
SERVER_EXTERNAL_SSL = os.getenv('SERVER_EXTERNAL_SSL', True)
SESSION_COOKIE_SAMESITE = 'Lax'
SESSION_TYPE = 'sqlalchemy'
SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'pdns.db')
SQLALCHEMY_TRACK_MODIFICATIONS = True

OFFLINE_MODE = False
SQLA_DB_USER = 'pdnsadmin'
SQLA_DB_PASSWORD = 'password'
SQLA_DB_HOST = '127.0.0.1'
SQLA_DB_NAME = 'pdns'
SQLALCHEMY_TRACK_MODIFICATIONS = True
