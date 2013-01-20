class SearchController < ApplicationController
  
  def index
    @city = City.first(10)
  end
  
end
