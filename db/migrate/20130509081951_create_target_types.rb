# encoding: utf-8

class CreateTargetTypes < ActiveRecord::Migration
  def change
    create_table :target_types do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :flag, :null=>false, :default=>true  
      t.timestamps     
    end
  end
end
