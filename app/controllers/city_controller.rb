class CityController < ApplicationController

  def index
    @city = City.search(params[:search])
  end
  
end
