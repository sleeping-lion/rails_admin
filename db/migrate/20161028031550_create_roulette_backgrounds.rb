# encoding: utf-8

class CreateRouletteBackgrounds < ActiveRecord::Migration
  def change
    create_table :roulette_backgrounds do |t|
      t.string :title, :null=>true, :limit=>60
      t.string :photo, :null=>false
      t.boolean :priority, :null=>false, :default=>false
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps
    end
  end
end
