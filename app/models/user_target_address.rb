class UserTargetAddress < ActiveRecord::Base
  attr_accessible :user_id, :address_id
  validates_presence_of :user_id, :address_id
  validates :user_id, :uniqueness => {:scope => :address_id}  
  belongs_to :user
  belongs_to :address
end