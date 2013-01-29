class SearchController < ApplicationController
  
  def index
    @city = City.first(10)
    if signed_in?
      @profile = current_user.profile
      @favorites = Favorite.where("profile_id = ?", @profile.user_id)
    end
  end
  
end
