# encoding: utf-8

class CreatePointTypes < ActiveRecord::Migration
  def change
    create_table :point_types do |t|
      t.string :title, :null=>false, :limit=>60
      t.integer :amount, :null => false, :default => 0
      t.boolean :flag, :null=>false, :default=>true 
      t.timestamps     
    end
  end
end
