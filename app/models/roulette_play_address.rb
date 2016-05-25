# encoding: utf-8

class RoulettePlayAddress < ActiveRecord::Base
  attr_accessible :roulette_play_id, :address_id, :name, :mobilephone, :address, :primary_flag
  validates_presence_of :roulette_play_id, :address_id, :name, :mobilephone, :address
  
  belongs_to :users, :autosave => true
  # belongs_to :roulette_play, :autosave => true
end
