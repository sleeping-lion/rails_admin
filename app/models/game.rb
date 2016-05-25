# encoding: utf-8

class Game < ActiveRecord::Base
  attr_accessible :id, :user_id, :game_setting_id, :point_id
  validates_presence_of :user_id, :point_id
  validates :amount, :numericality => { :only_integer => true }
  validates :user_id, :numericality => { :only_integer => true }
  # in China  belongs_to :coupon
  belongs_to :point  
  belongs_to :user
  belongs_to :game_setting
end
