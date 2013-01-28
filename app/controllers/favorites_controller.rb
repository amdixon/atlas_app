class FavoritesController < ApplicationController
  
  def create

    @favorite = Favorite.create!(params[:favorite])
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
  
end
