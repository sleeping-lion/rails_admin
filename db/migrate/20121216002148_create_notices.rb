# encoding: utf-8

class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title,:limit=>60,:null=>false, :limit=>60
      t.integer :view_count, :default => 0
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end
    
    create_table :notice_contents do |t|
      t.boolean :html,:default=>0,:null=>false
      t.text :content,:null=>false
    end
  end
end
