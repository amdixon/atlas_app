class CityController < ApplicationController

  def index
    @city = City.search(params[:search])
    @user = current_user
    @profile = Profile.find_by_user_id(@user.id)
  end
  
end
