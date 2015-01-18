env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. 
# The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment

# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "postgres://localhost:15432/chitter_#{env}")


require_relative './models/init'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!