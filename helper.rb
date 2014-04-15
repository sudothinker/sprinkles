HOST = 'mysite.com'
HOSTIP = '255.255.255.255'
ROOT_USER = 'root'
ROOT_USER_PASSWORD = 'my_root_password'
DEPLOY_USER = 'deploy'
DEPLOY_USER_PASSWORD = 'my_deploy_password'
DEPLOY_POSTGRES_PASSWORD = 'my_postgres_password'
APP_NAME = 'mysite'
DB_NAME = "#{APP_NAME}_production"
GIT_HOST = "domain.com"

# Load all packages
Dir[ File.dirname(__FILE__) + '/packages/*.rb'].each { |file| require file }

