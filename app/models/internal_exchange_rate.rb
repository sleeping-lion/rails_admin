class InternalExchangeRate < ActiveRecord::Base
  attr_accessible :rate
  validates_presence_of :rate
end
