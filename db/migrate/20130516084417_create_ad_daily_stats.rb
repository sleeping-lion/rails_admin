# encoding: utf-8

class CreateAdDailyStats < ActiveRecord::Migration
  def change
    create_table :ad_daily_stats do |t|
      t.references :ad_log_type
      t.references :ad           
      t.date :date
      t.integer :hour
      t.integer :log_count
      t.integer :point_sum      
      t.timestamps
    end
  end
end
