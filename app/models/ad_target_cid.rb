# encoding: utf-8

class AdTargetCid < ActiveRecord::Base
  attr_accessible :ad_schedule_id, :cid, :flag
  validates :ad_schedule_id, :uniqueness => {:scope => :cid}
  belongs_to :ad_schedule
end
