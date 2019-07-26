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
      Main.create(name: params[:new_ingredient].strip)
    elsif params[:selector] == "side"
      Side.create(name: params[:new_ingredient].strip)
    end
      flash[:success] = "Successfully created new ingredient."

    redirect "/ingredients"
  end


end
