class RoulettePlay < ActiveRecord::Base
  attr_accessible :id, :user_id, :roulette_setting_id, :point_id, :client_ip
  validates_presence_of :user_id, :point_id, :client_ip
  validates :user_id, :numericality => { :only_integer => true }
  validates :point_id, :numericality => { :only_integer => true }   
  validates :amount, :numericality => { :only_integer => true }
  belongs_to :point
  belongs_to :user
  belongs_to :roulette_setting
  has_many :roulette_play_address, :dependent=>:destroy
  has_many :roulette_plays_roulette_present, :dependent=>:destroy  
  has_many :roulette_present, :through => :roulette_plays_roulette_present
end
