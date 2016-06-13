class AdFile < ActiveRecord::Base
  attr_accessible :filetype, :filename, :fileext, :filesize, :checksum, :valid, :photo, :ad_id, :ad_file_type_id, :photo_cache, :flag
  validates_presence_of :ad_id
  belongs_to :ad, :autosave => true, :counter_cache => true
  belongs_to :ad_file_type, :autosave => true
  mount_uploader :photo, AdUploader
end
