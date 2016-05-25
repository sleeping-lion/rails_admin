# encoding: utf-8

class GameAmount < ActiveRecord::Base
  attr_accessible :amount
  validates_presence_of :amount
  validates :amount, :numericality => { :only_integer => true }
end
