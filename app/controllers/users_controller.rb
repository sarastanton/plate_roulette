class UsersController < ApplicationController

	get "/signup" do
		if logged_in?
			redirect "/"
		else
			erb :"users/signup"
		end
	end

	post "/signup" do
		@user = User.new(username: params[:username], email: params[:email], password: params[:password])
		@user.save
		if @user.save
			session[:user_id] = @user.id
			redirect "/"
		else
			redirect "/signup"
		end
	end

	get "/login" do
		if logged_in?
			redirect "/"
		else
			erb :"users/login"
		end
	end

	post "/login" do
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/"
		else
			redirect "/login"
		end
	end

	get "/logout" do
		session.clear
		redirect "/"
	end

	get "/users/plates" do
		erb :"/users/plates"
	end

end
