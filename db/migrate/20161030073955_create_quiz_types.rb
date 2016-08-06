# encoding: utf-8

class CreateQuizTypes < ActiveRecord::Migration
  def change
    create_table :quiz_types do |t|
      t.string :title, :null=>true, :limit=>100
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps
    end
  end
end
