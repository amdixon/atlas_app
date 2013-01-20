class SearchSuggestionsController < ApplicationController
  
  def index
    @city = City.search(params[:term])
    render :json => @city.map { |city| city.name }
  
  end

end
