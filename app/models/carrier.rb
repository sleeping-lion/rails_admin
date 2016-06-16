class Carrier < ActiveRecord::Base
  attr_accessible :title, :code, :flag
  validates_presence_of :title
  validates_length_of :title, :minimum => 4, :maximum => 60
end
