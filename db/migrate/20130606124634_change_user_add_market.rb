# encoding: utf-8

class ChangeUserAddMarket < ActiveRecord::Migration
  def up
    add_column :users, :market, :string, :null => true, :limit => 100
  end

  def down
    remove_column :users, :market
  end
end
