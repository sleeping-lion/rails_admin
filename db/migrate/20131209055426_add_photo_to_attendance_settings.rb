class AddPhotoToAttendanceSettings < ActiveRecord::Migration
  def up
    add_column :attendance_settings, :photo, :string, :null => true, :limit => 255
  end

  def down
    remove_column :attendance_settings, :photo
  end
end
