# encoding: utf-8

class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :title, :string, :limit => 60      
      t.string :code, :string, :limit => 10
      t.boolean :flag, :default => false
      t.timestamps
    end
  end
end
