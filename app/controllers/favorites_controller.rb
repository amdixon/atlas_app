class FavoritesController < ApplicationController
  
  def create
    @favorite = Favorite.create!(params[:favorite]) unless Favorite.exists?(params[:name][:profile_id])
    respond_to do |format|
      format.html { redirect_to favorite_url }
      format.js
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
