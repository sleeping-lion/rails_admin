class AddFieldsToAdOptions < ActiveRecord::Migration
  def up
    add_column :ad_options, :cpi_publisher, :string, :null => false, :default => '', :limit => 100
    add_column :ad_options, :cpi_apk_size, :string, :null => false, :default => '', :limit => 100
    add_column :ad_options, :cpi_version, :string, :null => false, :default => '', :limit => 100
  end

  def down
    remove_column :ad_options, :cpi_publisher
    remove_column :ad_options, :cpi_apk_size
    remove_column :ad_options, :cpi_version
  end
end
