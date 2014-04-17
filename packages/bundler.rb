package :bundler do
  requires :ruby, :rubygems
  description 'Bundler'
  version '1.6.2'

  gem 'bundler'
  
  verify do
    has_gem "bundler", version
    has_executable "bundle"
  end
end
