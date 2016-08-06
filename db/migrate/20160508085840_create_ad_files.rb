# encoding: utf-8

class CreateAdFiles < ActiveRecord::Migration
  def change
    create_table :ad_files do |t|
      t.references :ad, :null => false
      t.references :ad_file_type, :null => false
      t.string :filetype, :null => false
      t.string :fileext, :null => false
      t.integer :filesize, :null => false, :default => 0
      t.string :checksum, :null => false
      t.string :photo
      t.boolean :flag, :null => false, :default => true
      t.timestamps
    end

    add_index :ad_files, :ad_id
    add_index :ad_files, :filetype
   end
end
