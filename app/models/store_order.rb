# encoding: utf-8

class StoreOrder < ActiveRecord::Base
  attr_accessible :amount, :customer_tel, :delivery_name, :delivery_address_1, :delivery_address_2, :delivery_note, :delivery_tel, :delivery_zipcode, :return_flag, :return_reason, :return_time, :shipping_flag, :shipping_method, :shipping_time, :shipping_track_number, :store_order_status_id, :store_good_id, :user_id
  validates_presence_of :amount, :customer_tel, :delivery_name, :delivery_address_1, :delivery_note, :delivery_tel, :delivery_zipcode, :return_time, :shipping_time, :store_order_status_id, :store_good_id, :user_id
  validates :amount, :numericality => { :only_float => true }
  belongs_to :user, :autosave => true
  belongs_to :store_good, :autosave => true
  belongs_to :store_order_status, :autosave => true
end