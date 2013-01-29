class SearchSuggestionsController < ApplicationController
  
  def index
    search = params[:term].upcase
    if search
      @city = City.where( ["name LIKE ?", "%#{search}%"] ).take(10)
    else
      @city = City.all
    end
    
    render :json => @city.map { |city| city.name }
  
  end

end
