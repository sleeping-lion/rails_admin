# encoding: utf-8

class Address < ActiveRecord::Base
  attr_accessible :id, :parent_address_id, :level, :name, :full_address, :flag
  validates_presence_of :level, :name, :full_address
  belongs_to :parent_address, :class_name => "Address", :foreign_key =>:parent_address_id
  has_many :user_target_address
  has_many :user, :through => :user_target_address 
end
