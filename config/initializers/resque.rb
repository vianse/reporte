#Resque.redis = '162.243.48.92:6379'
#redis_client = Redis.new(:url => "redis://root:hola123,@162.243.48.92:6379")
redis_client = Redis.new(url: (ENV['REDISTOGO_URL'] || 'redis://root:hola123,@162.243.48.92:6379'))
#Redis.new(url: (ENV['REDISTOGO_URL'] || 'redis://root:hola123,@162.243.48.92:6379'))
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }