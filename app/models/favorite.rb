class Favorite < ActiveRecord::Base
  acts_as_list :scope => :profile
  
  attr_accessible :city_id, :name, :country, :position, :profile_id
  
  belongs_to :profile, :dependent => :destroy
  
  default_scope order: "position"
  
  def favorite_link
    name + ',' + ' ' + country
  end
  
end
