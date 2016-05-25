# encoding: utf-8

class RouletteBackground < ActiveRecord::Base
  attr_accessible :title, :priority, :photo, :photo_cache, :flag
  validates_presence_of :title
  mount_uploader :photo, RouletteBackgroundUploader
end
