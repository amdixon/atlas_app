class Place < ActiveRecord::Base
  attr_accessible :city_id, :favorite_id
  
  # This is the join model between cities and user favorites
  belongs_to :city
  belongs_to :favorite
end
