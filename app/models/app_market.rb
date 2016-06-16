class AppMarket < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
  validates_length_of :title, :minimum => 4, :maximum => 60
end
