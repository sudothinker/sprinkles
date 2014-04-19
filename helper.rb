# HOST = 'shakingrocks.com'
HOST = '192.241.219.167'
# HOSTIP = '173.255.254.65'
HOSTIP = '192.241.219.167'
APP_NAME = 'shakingrocks'
HOST_NAME = 'shakingrocks'
DEPLOY_USER = 'deploy'

$users = [
  ['michael', File.read('/Users/uno/.ssh/id_rsa_do.pub') ],
  ['deploy', File.read('/Users/uno/.ssh/id_rsa_do.pub') ]
]

# Load all packages
Dir[ File.dirname(__FILE__) + '/packages/*.rb'].each { |file| require file }