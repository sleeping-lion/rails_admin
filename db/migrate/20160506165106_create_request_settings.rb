# encoding: utf-8

class CreateRequestSettings < ActiveRecord::Migration
  def change
    create_table :request_settings do |t|
      t.string :title, :null=>false, :limit=>60
      t.integer :amount,:null=>false
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps
    end
  end
end
