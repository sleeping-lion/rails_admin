# encoding: utf-8

class ChangeSponsorsAddAdsCount < ActiveRecord::Migration
  def up
    add_column :sponsors, :ads_count, :integer, :null => false, :default => 0
  end

  def down
    remove_column :sponsors, :ads_count
  end
end
