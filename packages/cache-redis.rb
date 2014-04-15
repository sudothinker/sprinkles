package :redis, :provides => :cache do
  description 'Redis Database'
  apt 'redis-server'
  verify do
    has_executable '/usr/local/bin/redis-server'
    has_file '/usr/local/bin/redis-server'
  end

  requires :build_essential
end