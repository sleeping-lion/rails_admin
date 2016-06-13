class Ad < ActiveRecord::Base
  attr_accessible :title, :ad_type_id, :sponsor_id, :agent_id, :priority, :show, :description, :memo, :flag, :display_type, :ad_memo_attributes, :ad_state_attributes, :ad_option_attributes, :ad_schedule_attributes
  validates_presence_of :title, :ad_type_id, :sponsor_id, :agent_id
  belongs_to :ad_type, :autosave=>true
  belongs_to :agent, :class_name => "Admin"
  belongs_to :sponsor, :autosave=>true, :counter_cache => true
  has_one :ad_state, :dependent=>:destroy
  has_one :ad_option, :dependent=>:destroy
  has_one :ad_memo, :foreign_key => :id, :dependent=>:destroy 
  has_many :ad_file, :dependent=>:destroy
  has_many :ad_schedule, :dependent=>:destroy
  has_many :ad_target, :through => :ad_schedule
  has_many :ad_target_address, :through => :ad_schedule
  has_many :ad_target_cid, :through => :ad_schedule
  has_many :points_ad, :dependent=>:destroy
  has_many :point, :through => :points_ad
  accepts_nested_attributes_for :ad_memo, :allow_destroy => true
  accepts_nested_attributes_for :ad_state, :allow_destroy => true
  accepts_nested_attributes_for :ad_option, :allow_destroy => true
  accepts_nested_attributes_for :ad_schedule, :allow_destroy => true
end
