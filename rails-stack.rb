require File.expand_path('../helper', __FILE__)

policy :rails_stack, :roles => :app do
  requires :base
  requires :make_users

  requires :git

  requires :ruby
  requires :rubygems
  requires :bundler

  requires :webserver
  requires :appserver
  requires :database
  requires :search
  requires :redis

  requires :lock_root
end

deployment do
  # First time setup
  delivery :ssh do
    user 'root'
    password 'dexcvspdghap'
    role :app, '192.241.219.167'
    # set :use_sudo, true
    # set :run_method, :sudo
    # recipes ENV['RECIPE'] || 'deploy'
  end

  # Subsequent changes
  delivery :capistrano do
    # user 'deploy'
    # password 'dexcvspdghap'
    role :app, '192.241.219.167'
    set :use_sudo, true
    set :run_method, :sudo
    recipes ENV['RECIPE'] || 'deploy'
  end

  source do
    prefix   '/usr/local'           # where all source packages will be configured to install
    archives '/usr/local/sources'   # where all source packages will be downloaded to
    builds   '/usr/local/build'     # where all source packages will be built
  end
end
