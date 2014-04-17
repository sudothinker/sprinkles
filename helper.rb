HOST = 'shakingrocks.com'
HOSTIP = '173.255.254.65'
APP_NAME = 'shakingrocks'
HOST_NAME = 'shakingrocks'
DB_NAME = "#{APP_NAME}_production"

$users = %w(michael deploy)

# Load all packages
Dir[ File.dirname(__FILE__) + '/packages/*.rb'].each { |file| require file }