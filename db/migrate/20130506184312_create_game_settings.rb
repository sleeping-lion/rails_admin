# encoding: utf-8

class CreateGameSettings < ActiveRecord::Migration
  def change
    create_table :game_settings do |t|
      t.string :title, :null=>false, :limit=>60
      t.float :percentage, :null=>false, :default=>0
      t.integer :amount, :null=>false
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end
  end
end
