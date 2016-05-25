# encoding: utf-8

class Market < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
end
