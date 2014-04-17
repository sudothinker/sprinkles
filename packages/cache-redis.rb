package :redis, :provides => :cache do
  description 'Redis Database'
  apt 'redis-server'
  verify do
    has_executable 'redis-server'
  end

  requires :build_essential
end