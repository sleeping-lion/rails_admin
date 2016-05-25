# encoding: utf-8

class RouletteSetting < ActiveRecord::Base
  attr_accessible :id, :title, :percentage, :amount, :limit
  validates_presence_of :title, :percentage, :amount
  validates :amount, :numericality => { :only_integer => true }
#  validates :percentage, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
  has_many :roulette_play, :dependent=>:destroy
end
