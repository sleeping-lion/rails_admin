# encoding: utf-8

class TargetType < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
  has_many :target, :dependent=>:destroy
end