class CreateAttendanceEvents < ActiveRecord::Migration
  def change
    create_table :attendance_events do |t|
      t.string :title, :null => false, :limit => 60
      t.string :photo, :null => true, :limit => 255      
      t.boolean :flag
      t.timestamps
    end
  end
end
