require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  helpers do
  	def current_user
  		User.find_by(id: session[:user_id])
  	end

  	def logged_in?
  		session[:user_id] != nil
  	end

  	def login_status_display
  		if logged_in?
  			username = User.find_by(id: session[:user_id]).username
  			login_status = "You are logged in as #{username}"
  		else
  			login_status = "You are NOT logged in"
  		end
  	end

  end

 end