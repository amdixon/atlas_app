class CityController < ApplicationController

  def index
    @city = City.search(params[:search]).take(1)
    if signed_in?
      @user = current_user
      @profile = @user.profile
      @favorites = Favorite.where(:profile_id == 25)
      @newfav = Favorite.new
    end
  end
  
end
