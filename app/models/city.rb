class City < ActiveRecord::Base
  attr_accessible :country, :name, :position
  
  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"])
    else
      find(:all)
    end
  end  
  
end
