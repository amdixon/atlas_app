class SearchSuggestionsController < ApplicationController
  
  def index
    search = params[:term]
    if search
      @city = City.where( ["name LIKE ?", "%#{search}%"] )
    else
      @city = City.all
    end
    
    render :json => @city.map { |city| city.name }
  
  end

end
