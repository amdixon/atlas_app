# encoding: utf-8
class ProfileImageUploader < CarrierWave::Uploader::Base
    # Needed for image processing (resizing, cropping, etc.):
    include CarrierWave::MiniMagick

    # All storage is defined in the file config/initializers/carrierwave.rb
    # Local storage is :file, remote storage for production is :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Resize options:
    # resize_to_fill(width, height)
    # example: resize_to_fill(200, 200) will resize to 200x200 keeping aspect ratio but cropping if necessary
    # resize_to_fit(width, height)
    # example: resize_to_fit(300, 10000) will resize to the smaller dimension (for maintaining a certain height / width)
    # resize_to_limit(width, height)
    # example: resize_to_limit(200, 400) will resize only if the original image is larger than the specified dimensions

    # Resize for cropping:
    version :crop do
      resize_to_limit(260, 260)
    end
    
    # Resize image for the web:
    version :web do
        process :crop
        resize_to_fill(100, 100)
    end  

    # Resize image for mobile devices:
    version :mobile, :from_version => :web do
      resize_to_fill(50, 50)
    end
    
    def crop
      if model.crop_x.present?
        resize_to_limit(260, 260)
        manipulate! do |img|
          x = model.crop_x.to_i
          y = model.crop_y.to_i
          w = model.crop_w.to_i
          h = model.crop_h.to_i
          img.crop!(x, y, w, h)
        end
      end
    end
    
    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png)
    end

  end
