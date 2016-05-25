class AddFieldsToRoulettePlaysRoulettePresents < ActiveRecord::Migration
  def up
    add_column :roulette_plays_roulette_presents, :receive_flag, :string, :null => false, :default => '1', :limit => 1
  end

  def down
    remove_column :roulette_plays_roulette_presents, :receive_flag
  end
end

