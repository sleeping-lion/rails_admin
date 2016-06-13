class CouponType < ActiveRecord::Base
  attr_accessible :title, :amount, :flag, :name
  validates_presence_of :title  
end
