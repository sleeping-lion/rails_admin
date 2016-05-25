# encoding: utf-8

class ChangeAdSchedulesAddCpiOnlyFlag < ActiveRecord::Migration
  def up
    add_column :ad_schedules, :cpi_only_flag, :boolean, :null => false, :default => false
  end

  def down
    remove_column :ad_schedules, :cpi_only_flag
  end
end
