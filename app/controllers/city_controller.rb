class CityController < ApplicationController

  def index
    @city = City.search(params[:search]).take(1)
    if signed_in?
      @profile = current_user.profile
      @favorites = Favorite.where("profile_id = ?", @profile.user_id).limit(10)
      @newfav = Favorite.new
    end
  end
  
end
