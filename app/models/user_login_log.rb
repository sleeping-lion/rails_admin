class UserLoginLog < ActiveRecord::Base
  belongs_to :user
  attr_accessible :client_ip, :created_at, :device_id, :flag
end