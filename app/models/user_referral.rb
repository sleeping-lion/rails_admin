# encoding: utf-8

class UserReferral < ActiveRecord::Base
  attr_accessible :user_id, :recommend_user_id
  validates_presence_of :user_id, :recommend_user_id
  validates :user_id, :uniqueness => {:scope => :recommend_user_id}
  validates :user_id, :numericality => { :only_integer => true } 
  validates :recommend_user_id, :numericality => { :only_integer => true }     
  belongs_to :user
  belongs_to :recommend_user, :class_name => "User"
end