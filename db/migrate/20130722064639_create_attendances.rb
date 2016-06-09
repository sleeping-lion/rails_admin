# encoding: utf-8

class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :attendance_setting, :null=>false      
      t.references :user, :null=>false
  
      t.date :today
      t.integer :count
      t.boolean :flag
      t.timestamps
    end
    
    add_index :attendances, :attendance_setting_id
    add_index :attendances, :user_id    
  end
end
