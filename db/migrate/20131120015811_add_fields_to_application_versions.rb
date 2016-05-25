class AddFieldsToApplicationVersions < ActiveRecord::Migration
  def up
    add_column :application_versions, :state, :string, :null => false, :limit => 1
    add_column :application_versions, :contents, :string, :null => false, :limit => 255
  end

  def down
    remove_column :application_versions, :state
    remove_column :application_versions, :contents
  end
end
