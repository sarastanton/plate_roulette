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
    @possible_mains = []
    @possible_sides = []

    if params[:plate][:main] != ""
      @possible_mains << Main.create(name: params[:plate][:main])
    end
      params[:plate][:main_ids].each do |id|
        m = Main.find_by(id: id)
        @possible_mains << m
      end

    if params[:plate][:side] != ""
      @possible_sides << Side.create(name: params[:plate][:side])
    end
      params[:plate][:side_ids].each do |id|
        s = Side.find_by(id: id)
        @possible_sides << s
      end

    erb :"/plates/result"
  end

  post "/respin" do
    redirect "/plates/new"
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