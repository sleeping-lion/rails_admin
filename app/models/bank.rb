# encoding: utf-8

class Bank < ActiveRecord::Base
  attr_accessible :name,:flag
  validates_presence_of :name
end
