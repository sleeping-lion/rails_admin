# encoding: utf-8

class CreateStoreTypes < ActiveRecord::Migration
  def change
    create_table :store_types do |t|
      t.string :title, :limit=>60, :null=>false
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
