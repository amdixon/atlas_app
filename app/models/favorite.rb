class Favorite < ActiveRecord::Base
  acts_as_list :scope => :profile
  
  attr_accessible :city_id, :name, :country, :position, :profile_id
  
  belongs_to :profile
  
  has_many :places, :dependent => :destroy
  has_many :cities, :through => :places
  
  default_scope order: "position"
  
end
