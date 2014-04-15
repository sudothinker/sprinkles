require File.expand_path('../helper', __FILE__)

policy :rails_stack, :roles => :app do
  requires :tools
  requires :settings
  requires :version_control

  requires :ruby
  requires :rails

  requires :webserver
  requires :appserver
  requires :database
  requires :redis  
end

deployment do

  delivery :capistrano do
    recipes ENV['RECIPE'] || 'deploy'
  end

  source do
    prefix   '/usr/local'           # where all source packages will be configured to install
    archives '/usr/local/sources'   # where all source packages will be downloaded to
    builds   '/usr/local/build'     # where all source packages will be built
  end

end
