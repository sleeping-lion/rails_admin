class PointType < ActiveRecord::Base
  attr_accessible :id, :title, :amount, :flag, :transact_type, :created_at
  validates_presence_of :title
  validates :amount, :numericality => { :only_integer => true }    
end
