class AddFieldApkFileToApplicationVersions < ActiveRecord::Migration
  def up
    add_column :application_versions, :apk_file, :string, :null => true, :limit => 255
  end

  def down
    remove_column :application_versions, :apk_file
  end
end
