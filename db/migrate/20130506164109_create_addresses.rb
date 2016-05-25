# encoding: utf-8

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :parent_address, :null=>false, :default=>0
      t.integer :level, :default=>0, :null=>false
      t.string :name, :null=>false, :limit=>60
      t.string :zipcode, :null=>true, :limit=>10
      t.float :latitude, :null=>true, :default=>0.0
      t.float :longitude, :null=>true, :default=>0.0
      t.string :full_address, :null=>false, :limit=>255      
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end
    
    add_index :addresses, :parent_address_id
    add_index :addresses, :name
  end
end




