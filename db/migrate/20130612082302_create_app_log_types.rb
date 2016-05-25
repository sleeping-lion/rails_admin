# encoding: utf-8

class CreateAppLogTypes < ActiveRecord::Migration
  def change
    create_table :app_log_types do |t|
      t.string :title
      t.boolean :flag
      t.timestamps
    end
  end
end
