# encoding: utf-8

class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user, :null=>false
      t.references :point_type, :null=>false
      t.integer :amount, :null=>false, :default=>0
      t.timestamps
    end

    add_index :points, [ :user_id, :point_type_id ]  
  end
end
