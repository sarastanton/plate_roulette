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
    binding.pry
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