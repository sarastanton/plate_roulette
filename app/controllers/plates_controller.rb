class PlatesController < ApplicationController

  get "/" do
  	erb :"/index"
  end

  get "/plates" do
    if logged_in?
      erb :"/users/plates"
    else
      redirect "/"
    end
  end
 
  get "/plates/new" do
    if !logged_in?
      redirect "/"
    end
    @mains = Main.all
    @sides = Side.all
    sort_by_alpha
  	erb :"/plates/new"
  end

  post "/plates" do
    gather_the_possibles
    spin_the_roulette
    @plate = Plate.new
    @plate.mains << Main.find_by(name: @main_selection)
    @plate.sides << Side.find_by(name: @side_number_1)
    @plate.sides << Side.find_by(name: @side_number_2)
    @plate.save
    redirect "/plates/#{@plate.id}"
  end

  get "/plates/:id" do
    if !logged_in?
      redirect "/"
    end
    @plate = Plate.find_by_id(params[:id])
    erb :"/plates/result"
  end

  get "/plates/:id/edit" do
    @plate = Plate.find_by_id(params[:id])
    if logged_in? && @plate.user == current_user
        erb :"/plates/edit"
    else
      redirect "/plates"
    end
  end

  patch "/plates/:id" do
      @plate = Plate.find_by_id(params[:id])
      if params[:new_main] != ""
        m = Main.find_or_create_by(name: params[:new_main])
        @plate.mains.clear
        @plate.mains << m
      end

       if params[:new_side_1] != ""
        s1 = Side.find_or_create_by(name: params[:new_side_1])
        holder = []
        holder << @plate.sides
        @plate.sides = []
        @plate.sides << s1
        @plate.sides << holder
      end

        if params[:new_side_2] != ""
        s2 = Side.find_or_create_by(name: params[:new_side_2])
        @plate.sides << (s2)
      end

      @plate.save
      binding.pry

      redirect "/plates/#{@plate.id}"
    end


  post "/plates/:id/respin" do
    Plate.find_by_id(params[:id]).delete
    redirect "/plates/new"
  end

  post "/plates/:id/save" do
    @plate = Plate.find_by_id(params[:id])
    @plate.user_id = current_user.id
    current_user.plates << @plate
    redirect "/plates"
  end

  get "/plates/:id" do
    if !logged_in?
      redirect "/"
    end
  	@plate = Plate.find_by(id: params[:id])
    if current_user == @plate.user
  	erb :"/plates/show"
    else
      redirect "/plates"
    end
  end

  delete "/plates/:id/" do
  	@plate = Plate.find_by(params[:id])
  	if logged_in? && @plate.user == current_user
  		@plate.destroy
  	else
  		redirect "/"
  	end
  end

end