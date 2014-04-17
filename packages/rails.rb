package :rails do
  requires :rubygems
  description 'Ruby on Rails'
  version '3.0.10'

  applications_directory = '/var/www/'

  gem 'rails' do
    post :install, "mkdir -p #{applications_directory}"
    post :install, "chown -R $(whoami):www-data #{applications_directory}"
  end

  verify do
    has_executable 'rails'
    has_gem        "rails", version
    has_directory  applications_directory
  end
end
