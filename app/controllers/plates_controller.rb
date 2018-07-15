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
    if params[:main] != ""
      @main = Main.find_by(id: params[:plate][:main_id])
    else
      @main = Main.find_by(id: params[:main])
    end
    @side1 = "side 1 - just testing for now"
    @side2 = "side 2 - just testing for now"
    binding.pry
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