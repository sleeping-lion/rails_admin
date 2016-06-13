class StoreType < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
  has_many :store_good, :dependent=>:destroy
end