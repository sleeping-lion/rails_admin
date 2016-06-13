class Sponsor < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
  has_many :ad
end
