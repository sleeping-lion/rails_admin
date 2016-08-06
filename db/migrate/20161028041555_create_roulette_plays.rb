# encoding: utf-8

class CreateRoulettePlays < ActiveRecord::Migration
  def change
    create_table :roulette_plays do |t|
      t.references :roulette_setting
      t.references :user, :null=>false
      t.references :point      
      t.integer :amount, :null=>false
      t.integer :client_ip, :null=>false
      t.timestamps
    end
    
    add_index :roulette_plays, :roulette_setting_id
    add_index :roulette_plays, :user_id
    add_index :roulette_plays, :point_id
  end
end
