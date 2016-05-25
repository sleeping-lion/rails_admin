# encoding: utf-8

class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|     
      t.string :title,:limit=>60,:null=>false, :limit=>60
      t.integer :view_count, :default => 0
      t.boolean :flag, :null=>false, :default=>true      
      t.timestamps
    end
    
    create_table :faq_contents do |t|
      t.boolean :html,:default=>0,:null=>false      
      t.text :content,:null=>false
    end
  end
end
