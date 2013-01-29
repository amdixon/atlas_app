class CityController < ApplicationController

  def index
    test = params[:search]
    
    if test != ''
      search = test.upcase
      @city = City.search(params[:search]).take(1)
    else
      @city = City.find(:all, :order => 'RANDOM ()').take(1)
    end
    
    if signed_in?
      @profile = current_user.profile
      @favorites = Favorite.where("profile_id = ?", @profile.user_id).limit(10)
      @newfav = Favorite.new
    end
  end
  
end
