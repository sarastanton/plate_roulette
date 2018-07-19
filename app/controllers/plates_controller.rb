class PlatesController < ApplicationController

  get '/' do
  	erb :"/index"
  end

 
  get '/plates/new' do
    if !logged_in?
      redirect "/"
    end
    @mains = Main.all
    @sides = Side.all
    sort_by_alpha
  	erb :"/plates/new"
  end

  post '/plates' do
    gather_the_possibles
    spin_the_roulette
    @plate = Plate.new
    @plate.mains << Main.find_by(name: @main_selection)
    @plate.sides << Side.find_by(name: @side_number_1)
    @plate.sides << Side.find_by(name: @side_number_2)
    @plate.save
    redirect "/plates/result/#{@plate.id}"
  end

  get "/plates/result/:id" do
    if !logged_in?
      redirect "/"
    end
    @plate = Plate.find_by_id(params[:id])
    erb :"/plates/result"
  end

  post "/plates/result/:id/respin" do
    Plate.find_by_id(params[:id]).delete
    redirect "/plates/new"
  end

  post "/plates/result/:id/save" do
    @plate = Plate.find_by_id(params[:id])
    @plate.user_id = current_user.id
    current_user.plates << @plate
    redirect "/users/plates"
  end

  get '/plates/:id' do
    if !logged_in?
      redirect "/"
    end
  	@plate = Plate.find_by(id: params[:id])
    if current_user == @plate.user
  	erb :"/plates/show"
    else
      redirect "/users/plates"
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