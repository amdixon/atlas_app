class Profile < ActiveRecord::Base
  attr_accessible :home, :image, :crop_x, :crop_y, :crop_w, :crop_h
  
  belongs_to :user
  
  has_many :places, :dependent => :destroy
  has_many :favorites, :through => :places
  
  mount_uploader :image, ProfileImageUploader
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_photo

  def crop_photo
    photo.recreate_versions! if crop_x.present?
  end
  
end
