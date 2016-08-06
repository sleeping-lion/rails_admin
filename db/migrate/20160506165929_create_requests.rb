# encoding: utf-8

class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user
      t.references :request_setting
      t.references :point   # just references0
      t.references :request_type
      t.references :bank
      t.integer :amount, :null=>false, :default=>0
      t.string :account_owner, :null=>false, :limit=>100
      t.string :account_number, :null=>false, :limit=>100
      t.timestamps
    end
    
    add_index :requests, :user_id
    add_index :requests, :request_setting_id
    add_index :requests, :point_id
    add_index :requests, :request_type_id
    add_index :requests, :bank_id
  end
end