# encoding: utf-8

class ChangeStoreOrderChangeStatusReference < ActiveRecord::Migration
  def up
    remove_column  :store_orders, :status
    add_column :store_orders, :store_order_status_id, :integer, :null => false, :default => 1
  end

  def down
    remove_column :store_orders, :store_order_status_id
    add_column :store_orders, :status, :string, :limit => 60, :null => true
   end
end
