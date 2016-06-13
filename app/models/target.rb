class Target < ActiveRecord::Base
  attr_accessible :title, :target_type_id, :flag
  validates_presence_of :title, :target_type_id
  belongs_to :target_type
  has_many :user_target
  has_many :user, :through => :user_target
end