# encoding: utf-8

class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :bank_code, :null=>false, :limit=>10
      t.string :name, :null=>false, :limit=>60
      t.string :memo, :null=>true
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps    
    end
  end
end
