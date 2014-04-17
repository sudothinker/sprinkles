package :nginx, :provides => :webserver do
  description 'Nginx Web Server'

  apt 'nginx' do
    post :install, '/etc/init.d/nginx start'
  end

  verify do
    has_executable '/usr/sbin/nginx'
    has_executable '/etc/init.d/nginx'
  end
end