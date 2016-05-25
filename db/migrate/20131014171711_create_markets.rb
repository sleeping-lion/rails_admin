# encoding: utf-8

class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :title, :null=>false, :limit => 60
      t.integer :count, :null=>false, :default=>0
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
