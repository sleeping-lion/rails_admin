# encoding: utf-8

class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.references :admin, :null=>false  
      t.references :sponsor, :null=>false    
      t.references :agent, :null=>false   
      t.references :ad_type, :null=>false          
      t.string :title, :null=>false ,:limit=>60
      t.string :description, :null => true, :limit => 200
      t.boolean :priority, :null => false, :default => false
      
      t.integer :ad_schedules_count, :null => false, :default => 0
      t.integer :ad_files_count, :null => false, :default => 0
      t.integer :ad_file_image_count, :null => false, :default => 0
      t.boolean :flag, :null=>false, :default=>false
      t.timestamps
    end
    
    add_index :ads, :admin_id
    add_index :ads, :agent_id
    add_index :ads, :sponsor_id
    add_index :ads, :ad_type_id
  end
end
