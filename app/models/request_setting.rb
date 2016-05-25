# encoding: utf-8

class RequestSetting < ActiveRecord::Base
  attr_accessible :id, :title, :amount, :flag
  validates_presence_of :title, :amount
  validates :amount, :numericality => { :only_integer => true }
end
