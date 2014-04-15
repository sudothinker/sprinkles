package :ruby do
  requires :ruby_dependencies
  description 'Ruby Virtual Machine'
  # We need Ruby 1.9.2 for Passenger, see http://code.google.com/p/phusion-passenger/issues/detail?id=714
  version '2.0.0-p247'
  # patchlevel '290'

  source "ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-#{version}.tar.gz" do
    pre :install, 'apt-get purge ruby ruby1.9 ruby1.9.1 rubygems1.8 rubygems1.9 rubygems1.9.1'
  end

  verify { has_executable_with_version "/usr/local/bin/ruby", version }
end

package :ruby_dependencies do
  description 'Ruby Virtual Machine Build Dependencies'
  apt %w( bison zlib1g-dev libssl-dev libreadline5-dev libncurses5-dev libyaml-0-2 file )
end
