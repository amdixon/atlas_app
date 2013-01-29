class FavoritesController < ApplicationController
  
  def create
    @profile = current_user.profile
    @favorites = Favorite.where("profile_id = ?", @profile.user_id)
    @favorites.each do |f|
      if f.city_id == params[:city_id]
        @check = true
      end
    end 
    if @check == nil
      @favorite = Favorite.create!(params[:favorite]) unless Favorite.exists?(params[:favorite])
      respond_to do |format|
        format.html { redirect_to favorite_url }
        format.js
      end
    end
  end
  
  def sort
    params[:favorite].each_with_index do |id, index|
      Favorite.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  def destroy
      @favorite = Favorite.destroy(params[:id])
      respond_to do |format|
        format.html { redirect_to favorites_url }
        format.js
      end
    end
  
end
