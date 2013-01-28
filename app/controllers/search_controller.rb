class SearchController < ApplicationController
  
  def index
    @city = City.first(10)
    if signed_in?
      @profile = current_user.profile
      @favorites = Favorite.first(10)
    end
  end
  
end
