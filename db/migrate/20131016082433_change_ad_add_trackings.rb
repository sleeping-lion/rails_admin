# encoding: utf-8

class ChangeAdAddTrackings < ActiveRecord::Migration
  def up
    add_column :ads, :track_id1, :string, :null => true
    add_column :ads, :track_id2, :string, :null => true
  end

  def down
    remove_column :ads, :track_id1
    remove_column :ads, :track_id2
  end
end
