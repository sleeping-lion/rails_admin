# encoding: utf-8

class CreateAdLogTypes < ActiveRecord::Migration
  def change
    create_table :ad_log_types do |t|
      t.string :title, :null => false, :limit=>60   
      t.timestamps
    end
  end
end
