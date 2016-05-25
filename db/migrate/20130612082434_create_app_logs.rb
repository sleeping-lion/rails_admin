# encoding: utf-8

class CreateAppLogs < ActiveRecord::Migration
  def change
    create_table :app_logs do |t|
      t.references :app_log_type
      t.references :user
      t.integer :log_value
      t.timestamps
    end
    
    add_index :app_logs, :app_log_type_id
    add_index :app_logs, :user_id
  end
end
