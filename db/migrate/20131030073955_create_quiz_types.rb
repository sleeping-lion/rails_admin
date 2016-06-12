# encoding: utf-8

class CreateQuizTypes < ActiveRecord::Migration
  def change
    create_table :quiz_types do |t|
      t.string :title
      t.boolean :flag

      t.timestamps
    end
  end
end
