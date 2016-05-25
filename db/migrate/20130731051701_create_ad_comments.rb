# encoding: utf-8

class CreateAdComments < ActiveRecord::Migration
  def change
    create_table :ad_comments do |t|
      t.references :ad
      t.references :user
      t.string :content, :limit => 200
      
      t.integer :vote, :default => 0

      t.timestamps
    end
    add_index :ad_comments, :ad_id
    add_index :ad_comments, :user_id
  end
end
