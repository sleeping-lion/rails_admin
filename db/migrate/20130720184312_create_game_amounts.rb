# encoding: utf-8

class CreateGameAmounts < ActiveRecord::Migration
  def change
    create_table :game_amounts do |t|
      t.integer :amount, :null=>false
      t.boolean :flag, :null=>false, :default=>true  
      t.timestamps
    end
  end
end
