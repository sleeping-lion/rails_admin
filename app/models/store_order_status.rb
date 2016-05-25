class StoreOrderStatus < ActiveRecord::Base
  attr_accessible :flag, :title
  has_many :store_order
end