# encoding: utf-8

class CreateRequestTypes < ActiveRecord::Migration
  def change
    create_table :request_types do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps     
    end
  end
end
