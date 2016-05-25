# encoding: utf-8

class AdTarget < ActiveRecord::Base
  attr_accessible :ad_schedule_id, :target_id
  validates_presence_of :ad_schedule_id, :target_id
  validates :ad_schedule_id, :uniqueness => {:scope => :target_id}
  belongs_to :ad_schedule, :autosave=>true
  belongs_to :target, :autosave=>true
end
