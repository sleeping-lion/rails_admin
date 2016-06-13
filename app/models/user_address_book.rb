class UserAddressBook < ActiveRecord::Base
  attr_accessible :user_id,:address_id, :name, :mobilephone, :address, :primary_flag
  validates_presence_of :user_id,:address_id, :name, :mobilephone, :address

  belongs_to :user, :autosave => true
  #belongs_to :address, :foreign_key => :address_id, :autosave => true  
end
