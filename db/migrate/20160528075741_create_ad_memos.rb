# encoding: utf-8

class CreateAdMemos < ActiveRecord::Migration
  def change
    create_table :ad_memos do |t|
      t.text :content,:null=>false
    end
  end
end
