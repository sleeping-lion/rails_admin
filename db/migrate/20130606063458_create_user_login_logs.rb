# encoding: utf-8

class CreateUserLoginLogs < ActiveRecord::Migration
  def change
    create_table :user_login_logs do |t|
      t.references :user
      t.string :device_id, :null => true, :limit => 64
      t.integer :client_ip, :null => false
      t.boolean :flag, :null => false, :default => false
      t.timestamps
    end
    
    add_index :user_login_logs, :user_id
  end
end
