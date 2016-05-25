# encoding: utf-8

class StoreGood < ActiveRecord::Base
  attr_accessible :store_type_id, :description_short, :description, :flag, :order_count, :proirity_flag, :hot_flag, :new_flag, :sale_end_time, :sale_price, :sale_start_time, :sale_type, :stock_count, :title
  validates_presence_of :description_short, :description, :sale_end_time, :sale_price, :sale_start_time, :sale_type, :title
#  validates :money, :numericality => { :only_integer => true }

  has_many :store_good_picture
  has_many :store_order
end
