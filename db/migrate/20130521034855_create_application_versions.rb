# encoding: utf-8

class CreateApplicationVersions < ActiveRecord::Migration
  def change
    create_table :application_versions do |t|
      t.string :client_version, :null => false, :limit=>60
      t.string :version_name, :null => false, :limit=>60
      t.datetime :update_date, :null => false
      t.boolean :flag, :null => false, :default => true
      t.timestamps
    end
  end
end
