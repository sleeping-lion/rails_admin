# encoding: utf-8

class ChangeStoreGoodsAddNewFlag < ActiveRecord::Migration
  def up
    add_column :store_goods, :new_flag, :boolean, :null => false, :default => false
  end

  def down
    remove_column :store_goods, :new_flag
  end
end
