# encoding: utf-8

class Device < ActiveRecord::Base
  attr_accessible :device_id, :registration_id, :user_id
  belongs_to :user, :autosave=>true  
end
