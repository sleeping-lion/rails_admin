class RoulettePresent < ActiveRecord::Base
  attr_accessible :title, :priority, :photo, :photo_cache, :flag
  validates_presence_of :title
  has_many :roulette_plays_roulette_present, :dependent=>:destroy
  mount_uploader :photo, RoulettePresentUploader
end
