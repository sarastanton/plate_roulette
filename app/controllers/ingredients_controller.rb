class IngredientsController < ApplicationController

 get "/ingredients" do
 	 if !logged_in?
      redirect "/"
    end
    @mains = Main.all
    @sides = Side.all
    sort_by_alpha
    erb :"/ingredients/index"
  end

  post "/ingredients" do
    if params[:selector] == "main"
      Main.create(name: params[:new_ingredient])
    elsif params[:selector] == "side"
      Side.create(name: params[:new_ingredient])
    end
      
    redirect "/ingredients"
  end


end
