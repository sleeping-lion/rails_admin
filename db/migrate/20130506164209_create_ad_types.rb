# encoding: utf-8

class CreateAdTypes < ActiveRecord::Migration
  def change
    create_table :ad_types do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :file_prefix, :limit=>60
      t.integer :max_file_count, :default=>1
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps     
    end
  end
end
