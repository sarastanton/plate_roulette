source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/sarastanton/plate_roulette" }

gem 'sinatra'
gem 'activerecord', :require => "active_record"
gem 'rake'
gem 'sinatra-activerecord'
gem "rack", ">= 2.0.6"
gem 'shotgun'
gem 'require_all'
gem 'bcrypt'
gem 'rack-flash3'
gem 'sinatra-flash'
gem 'pry'

group :production do
	gem 'pg'
end

group :development, :test do
	gem 'sqlite3'
  gem 'tux'
end

ruby '2.4.1'
