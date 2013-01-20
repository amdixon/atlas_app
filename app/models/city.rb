class City < ActiveRecord::Base
  attr_accessible :country, :name, :position
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end  
  
end
