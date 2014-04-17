HOST = 'shakingrocks.com'
HOSTIP = '173.255.254.65'
DEPLOY_USER = 'deploy'
APP_NAME = 'shakingrocks'
DB_NAME = "#{APP_NAME}_production"

# Load all packages
Dir[ File.dirname(__FILE__) + '/packages/*.rb'].each { |file| require file }