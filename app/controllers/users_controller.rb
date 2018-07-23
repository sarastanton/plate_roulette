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
			flash[:success] = "Successfully signed up."
			redirect "/"
		else
			flash[:error] = "There was an error with signup - please try again!"
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
			flash[:success] = "Successfully signed in."
			redirect "/"
		else
			flash[:error] = "There was an error with login - please try again!"
			redirect "/login"
		end
	end

	get "/logout" do
		session.clear
		flash[:success] = "Successfully logged out."
		redirect "/"
	end

end
