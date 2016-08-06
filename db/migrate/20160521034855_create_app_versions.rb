# encoding: utf-8

class CreateAppVersions < ActiveRecord::Migration
  def change
    create_table :app_versions do |t|
      t.string :client_version, :null => false, :limit=>60
      t.string :version_name, :null => false, :limit=>60
      t.string :state, :null => false, :limit => 1
      t.string :contents, :null => false, :limit => 255
      t.string :apk_file, :null => true, :limit => 255              
      t.datetime :update_date, :null => false    
      t.boolean :flag, :null => false, :default => true
      t.timestamps
    end
  end
end
