class AddSettingsIdToAttendance < ActiveRecord::Migration
  def up
    add_column :attendances, :attendance_settings_id, :integer, :null => true
  end

  def down
    remove_column :attendances, :attendance_settings_id
  end
end
