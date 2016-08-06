# encoding: utf-8

class CreateRouletteSettings < ActiveRecord::Migration
  def change
    create_table :roulette_settings do |t|
      t.string :title, :null=>false, :limit=>60
      t.float :percentage, :null=>false, :default=>0
      t.integer :amount, :null=>false
      t.integer :limit, :null=>false, :default=>0      
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps
    end
  end
end
