# encoding: utf-8

class ChangeAdOptionAddTrackings < ActiveRecord::Migration
  def up
    remove_column :ads, :track_id1
    remove_column :ads, :track_id2
    add_column :ad_options, :track_id1, :string, :null => true
    add_column :ad_options, :track_id2, :string, :null => true
  end

  def down
    remove_column :ad_options, :track_id1
    remove_column :ad_options, :track_id2
  end
end
