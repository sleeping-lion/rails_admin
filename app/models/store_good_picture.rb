class StoreGoodPicture < ActiveRecord::Base
  attr_accessible :filename, :flag, :store_good_id, :title, :photo, :photo_cache
  validates_presence_of  :filename, :store_good_id, :title, :photo, :photo_cache
  belongs_to :store_good, :autosave=>true, :counter_cache => true
  mount_uploader :photo, StoreUploader  
end
