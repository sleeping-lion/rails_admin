# encoding: utf-8

class UserTarget < ActiveRecord::Base
  attr_accessible :user_id, :target_id  
  validates_presence_of :user_id, :target_id
  validates :user_id, :uniqueness => {:scope => :target_id}
  belongs_to :user
  belongs_to :target
end