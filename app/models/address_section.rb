class AddressSection < ActiveRecord::Base
  attr_accessible :id, :address_id, :section, :flag
  validates_presence_of :address_id, :section
  belongs_to :address
  validates :address_id, :numericality => { :only_integer => true }
  validates :section, :numericality => { :only_integer => true }
end
