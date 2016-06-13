class CreateAttendanceEvents < ActiveRecord::Migration
  def change
    create_table :attendance_event_prizes do |t|
      t.references :attendance_event, :null=>false        
      t.string :title, :null=>false, :limit => 60         
      t.integer :count
      t.string :photo, :null => true, :limit => 255      
      t.boolean :flag
      t.timestamps
    end
  end
end
