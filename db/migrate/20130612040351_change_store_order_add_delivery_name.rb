# encoding: utf-8

class ChangeStoreOrderAddDeliveryName < ActiveRecord::Migration
  def up
    add_column :store_orders, :delivery_name, :string, :limit => 60, :null => true
  end

  def down
    remove_column :store_orders, :delivery_name
  end
end
