# encoding: utf-8

class RoulettePlaysRoulettePresent < ActiveRecord::Base
  attr_accessible :roulette_play_id, :roulette_present_id
  validates_presence_of :roulette_play_id, :roulette_present_id
  validates :roulette_play_id, :numericality => { :only_integer => true }
  validates :roulette_present_id, :numericality => { :only_integer => true }
  belongs_to :roulette_play
  belongs_to :roulette_present
end
