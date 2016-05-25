# encoding: utf-8

class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user, :null=>false
      t.references :game_setting
      t.references :point # just references
      t.integer :amount, :null=>false
      t.timestamps
    end
    
    add_index :games, :user_id
    add_index :games, :game_setting_id
    add_index :games, :point_id
  end
end
