# encoding: utf-8

class CreateAttendanceSettings < ActiveRecord::Migration
  def change
    create_table :attendance_settings do |t|
      t.string :title, :limit => 200
      t.string :headtext, :limit => 200
      t.integer :prize5
      t.integer :prize10
      t.integer :prize15
      t.integer :prize20
      t.integer :prize25
      t.integer :prize30
      t.boolean :flag
      t.timestamps
    end
  end
end
