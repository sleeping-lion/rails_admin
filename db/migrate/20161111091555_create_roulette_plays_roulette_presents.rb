# encoding: utf-8

class CreateRoulettePlaysRoulettePresents < ActiveRecord::Migration
  def change
    create_table :roulette_plays_roulette_presents do |t|
      t.references :roulette_play, :null=>false
      t.references :roulette_present, :null=>false
      t.string :receive_flag, :null => false, :default => '1', :limit => 1      
    end
    
    add_index :roulette_plays_roulette_presents, :roulette_play_id
    add_index :roulette_plays_roulette_presents, :roulette_present_id
  end
end
