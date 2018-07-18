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

    def spin_the_roulette
      @main_selection = Main.find_by_id(@possible_mains[rand(0..@possible_mains.count-1)].id)
      @side_number_1 = @possible_sides[rand(0..@possible_sides.count-1)]
      @remaining_sides = @possible_sides - [@side_number_1]
      @side_number_2 = @remaining_sides[rand(0..@remaining_sides.count-1)]
    end

    def gather_the_possibles
      @possible_mains = []
      @possible_sides = []

      if params[:plate][:main] != ""
        @possible_mains << Main.create(name: params[:plate][:main])
      end
      if !!params[:plate][:main_ids]
        params[:plate][:main_ids].each do |id|
        m = Main.find_by(id: id)
        @possible_mains << m
      end
        end

      if params[:plate][:side] != ""
        @possible_sides << Side.create(name: params[:plate][:side])
      end
        params[:plate][:side_ids].each do |id|
          s = Side.find_by(id: id)
          @possible_sides << s
        end
      end
    end

 end