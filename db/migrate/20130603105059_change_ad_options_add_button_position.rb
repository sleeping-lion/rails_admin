# encoding: utf-8

class ChangeAdOptionsAddButtonPosition < ActiveRecord::Migration
  def up
    add_column :ad_options, :button_position, :integer
  end

  def down
    remove_column :ad_options, :button_position
  end
end
