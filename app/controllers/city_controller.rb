class CityController < ApplicationController

  def index
    @city = City.search(params[:search]).take(1)
  end
  
end
