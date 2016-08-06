# encoding: utf-8

class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|   
      t.string :title, :null=>false, :limit=>60
      t.integer :ads_countm,:null => false, :default => 0      
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end    
  end
end
