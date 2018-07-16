class PlatesController < ApplicationController

  get '/' do
  	erb :"/index"
  end

  get '/plates/new' do
    @mains = Main.all
    @sides = Side.all
  	erb :"/plates/new"
  end

  post '/plates' do
    @plate = Plate.new
          binding.pry

    if params[:plate][:main] != ""
      @main = Main.create(name: params[:plate][:main])
    else
      @main = Main.find_by(id: params[:plate][:main_id][])
    end
    @plate.mains << @main

   if params[:plate][:side] != ""
      @side = Side.create(name: params[:plate][:side])
    else
      @side = Side.find_by(id: params[:plate][:side_id][])
    end
    @plate.sides << @side

    erb :"/plates/result"
  end

  get '/plates/:id' do
  	@plate = Plate.find_by(id: params[:id])
  	if logged_in?
  		erb :"/plates/show"
  	else redirect "/"
  	end
  end

  delete '/plates/:id/delete' do
  	@plate = Plate.find_by(params[:id])
  	if logged_in? && @plate.user == current_user
  		@plate.destroy
  	else
  		redirect "/"
  	end
  end

end