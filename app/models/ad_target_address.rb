class AdTargetAddress < ActiveRecord::Base
  attr_accessible :ad_schedule_id, :address_id
  validates_presence_of :ad_schedule_id, :address_id
  validates :ad_schedule_id, :uniqueness => {:scope => :address_id}   
  belongs_to :ad_schedule
  belongs_to :address
end