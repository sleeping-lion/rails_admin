# encoding: utf-8

class GameSetting < ActiveRecord::Base
  attr_accessible :id, :title, :percentage, :amount
  validates_presence_of :title, :percentage, :amount
  validates :amount, :numericality => { :only_integer => true }
  #validates :percentage
  has_many :game
end
