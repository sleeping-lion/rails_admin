# encoding: utf-8

class CreateAdminActionLogs < ActiveRecord::Migration
  def change
    create_table :admin_action_logs do |t|
      t.references :admin
      t.string :action, :null => false, :limit => 100
      t.string :user_ip, :null => false
      t.timestamps
    end
    
    add_index :admin_action_logs, :admin_id    
  end
end
