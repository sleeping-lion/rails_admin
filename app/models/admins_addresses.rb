# encoding: utf-8

class AdminsAddresses < ActiveRecord::Base
  belongs_to :admin
  belongs_to :address
end