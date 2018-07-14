class PlatesController < ApplicationController

  get '/' do
  	erb: "/index"
  end

  get '/plates' do
  	erb: "/plates/show"
  end

end