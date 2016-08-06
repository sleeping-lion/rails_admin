# encoding: utf-8

# TODO: Map with code -> status, shipping_method, return_reason

class CreateStoreOrders < ActiveRecord::Migration
  def change
    create_table :store_orders do |t|
      t.references :store_good
      t.references :user
      t.float :amount
      t.string :customer_tel, :null => false, :limit => 40
      t.string :delivery_tel, :null => false, :limit => 40
      t.string :delivery_zipcode, :null => false, :limit => 40
      t.string :delivery_address_1, :null => false, :limit => 40
      t.string :delivery_address_2, :null => true, :limit => 40
      t.string :delivery_note, :null => true, :limit => 200
      t.integer :status, :null => false, :default => 0
      t.string :shipping_method, :null => true
      t.string :shipping_track_number, :null => true
      t.datetime :shipping_time, :null => true
      t.boolean :shipping_flag, :null => true, :default => false
      t.string :return_reason, :null => true
      t.datetime :return_time, :null => true
      t.boolean :return_flag, :null => false, :default => false
      t.text :note, :null => true
      t.timestamps
    end
    
    add_index :store_orders, :store_good_id
    add_index :store_orders, :user_id
  end
end
