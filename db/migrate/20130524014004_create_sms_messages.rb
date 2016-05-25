# encoding: utf-8

class CreateSmsMessages < ActiveRecord::Migration
  def change
    create_table :sms_messages do |t|
      t.integer :msg_status, :null => false, :default => 0
      t.string :msg_phone, :limit => 30, :null => false
      t.string :msg_callback, :limit => 30, :null => false
      t.string :msg_charset, :limit => 10, :null => false
      t.string :msg_text, :limit => 1000, :null => false
      t.datetime :msg_sendtime, :null => true
      t.datetime :msg_rslttime, :null => true 
      t.datetime :msg_lasttime, :null => true
      t.integer :msg_rsltcode, :null => true
      t.integer :msg_priority, :null => false, :default => 0      
      t.string :msg_device_id, :null => true
      t.references :user, :null => true
      t.timestamps
    end
    
    add_index :sms_messages, :id    
  end
end
