# encoding: utf-8

class CreateAttendancePictures < ActiveRecord::Migration
  def change
    create_table :attendance_pictures do |t|
      t.references :attendance_setting
      t.string :title, :null => false, :limit => 100
      t.date :start_date, :null=>false
      t.string :photo
      t.boolean :flag, :null => false, :default  => true
      t.timestamps
    end
    
    add_index :attendance_pictures, :attendance_setting_id
  end
end
