# encoding: utf-8

class AdUploader < CarrierWave::Uploader::Base
  
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.ad.id}/#{model.id}"
  end
  
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  
  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  def scale(width, height)
    # do something
  end
  
  # Create different versions of your uploaded files:
  version :small_thumb, :if=>:is_thumb? do
    #process :resize_to_fill => [119, 85]
    process :resize_to_fill => [100, 100]
  end
  
  version :medium_thumb do
    process :resize_to_fill => [100, 100]
  end
    
  # cpi 중 가로  180 사이즈  추가  by DT.pwc
  version :client_180, :if=>:is_need? do
    process :resize_to_fit => [ 180,0 ]
  end
 
  version :client_320, :if=>:is_need? do
    process :resize_to_fit => [ 320,0 ]
  end
  
  version :client_480, :if=>:is_need? do
    process :resize_to_fit => [ 480,0 ]
  end
  
  version :client_640, :if=>:is_need? do
    process :resize_to_fit => [ 640,0 ]
  end  
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(png jpg mp4)
  end
  
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  protected
  
  def is_thumb? photo
    if(model.ad_file_type_id==1)
      return true
    end
    false
  end
  
  def is_need? photo
    if(model.ad_file_type_id!=1)
      return true
    end
    false
  end
end
