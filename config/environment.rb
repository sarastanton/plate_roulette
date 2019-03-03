require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/development')

require_all 'app'
