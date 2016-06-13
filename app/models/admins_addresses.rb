class AdminsAddresses < ActiveRecord::Base
  belongs_to :admin
  belongs_to :address
end