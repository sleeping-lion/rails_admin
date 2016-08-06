# encoding: utf-8

class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets  do |t|
      t.references :target_type, :null=>false
#      t.references :parent_target, :null=>true
      t.string :title, :null=>false, :limit=>100
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps
    end
    
    add_index :targets, :target_type_id
  end
end
