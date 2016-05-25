# encoding: utf-8

class CreateStoreGoodPictures < ActiveRecord::Migration
  def change
    create_table :store_good_pictures do |t|
      t.references :store_good
      t.string :type, :limit => 40
      t.string :title, :null => true, :limit => 100
      t.string :filename, :limit => 100
      t.string :photo      
      t.boolean :flag, :null => false, :default  => true
      t.timestamps
    end
    
    add_index :store_good_pictures, :store_good_id
  end
end
