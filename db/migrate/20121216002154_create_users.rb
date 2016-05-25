# encoding: utf-8

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, :limit=>40
      t.string :nickname, :limit=>40  # in China , :null => false
      t.string :email, :limit=>100 # in China  ,:null => false
      t.string :encrypted_password, :null => false, :limit=>40
      t.string :salt, :null=>false, :limit=>40
      t.string :photo
      t.string :nation_num, :null=>false, :default=>'86', :limit=>10
      t.string :mobile_num, :null=>false, :limit=>20
      t.string :service_provider, :null=>false, :limit=>20
      t.string :device_id, :null=>false, :limit=>100
      t.integer :point, :null=>false, :default=>0
      t.integer :coupon, :null=>false, :default=>0
      t.string :client_version, :null => true      
      t.datetime :last_seen_at, :null => true
      
      ## Rememberable
      # t.datetime :remember_created_at      
      
      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.boolean  :flag, :null=>false, :unsigned=>true, :default=>true 
      t.timestamps
    end
    
    add_index :users, :username, :unique => true    
    add_index :users, :nickname, :unique => true    
    add_index :users, :email, :unique => true
    # add_index :users, :mobile_num, :unique => true    
  end
end
