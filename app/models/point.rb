class Point < ActiveRecord::Base
  attr_accessible :point_type_id, :user_id, :ad_id, :amount
  validates_presence_of :point_type_id, :user_id, :amount
  validates :user_id, :numericality => { :only_integer => true }
  validates :amount, :numericality => { :only_integer => true }
  belongs_to :user, :autosave=>true
  belongs_to :point_type, :autosave=>true
#  has_many :game  # in China
  has_many :points_ad, :dependent=>:destroy
  has_many :ad, :through => :points_ad
end
