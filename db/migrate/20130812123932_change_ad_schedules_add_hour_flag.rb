# encoding: utf-8

class ChangeAdSchedulesAddHourFlag < ActiveRecord::Migration
  def up
    add_column :ad_schedules, :hour_flag, :boolean, :null => false, :default => false
  end

  def down
    remove_column :ad_schedules, :hour_flag
  end
end
