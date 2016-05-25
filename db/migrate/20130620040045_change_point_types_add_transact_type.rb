# encoding: utf-8

class ChangePointTypesAddTransactType < ActiveRecord::Migration
  def up
    add_column :point_types, :transact_type, :integer, :null => false, :default => 0
  end

  def down
    remove_column :point_types, :transact_type
  end
end
