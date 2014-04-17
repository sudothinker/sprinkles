package :rubygems do
  requires :ruby
  description 'Ruby Gems Package Management System'
  version '2.2.2'

  source "http://production.cf.rubygems.org/rubygems/rubygems-#{version}.tgz" do
    custom_install 'ruby setup.rb'
  end

  verify { has_executable_with_version '/usr/local/bin/gem', version }
end
