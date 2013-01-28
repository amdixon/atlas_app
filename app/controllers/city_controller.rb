class CityController < ApplicationController

  def index
    @city = City.search(params[:search])
    if signed_in?
      @profile = current_user.profile
      @favorites = Favorite.first(10)
      @favorite = Favorite.new
    end
  end
  
end
