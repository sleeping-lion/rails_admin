# encoding: utf-8

class AdSchedule < ActiveRecord::Base
  attr_accessible :ad_id, :title, :start_time, :end_time, :flag, :cpi_only_flag, :start_hour, :end_hour, :expire_time, :weekday0, :weekday1, :weekday2, :weekday3, :weekday4, :weekday5, :weekday6
  validates_presence_of :ad_id, :start_time, :end_time, :expire_time
  belongs_to :ad, :autosave=>true, :counter_cache => true
  has_many :ad_target, :dependent=>:destroy
  has_many :ad_target_address, :dependent=>:destroy, :class_name => "AdTargetAddress"
  has_many :ad_target_cid, :dependent=>:destroy
  accepts_nested_attributes_for :ad_target, :allow_destroy => true
  accepts_nested_attributes_for :ad_target_address, :allow_destroy => true
  accepts_nested_attributes_for :ad_target_cid, :allow_destroy => true
end
