class PointsAd < ActiveRecord::Base
  attr_accessible :ad_id, :point_id
  validates_presence_of :ad_id, :point_id 
  validates :ad_id, :numericality => { :only_integer => true }
  validates :point_id, :numericality => { :only_integer => true }  
  belongs_to :ad
  belongs_to :point
end
