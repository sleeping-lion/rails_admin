class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.references :quiz_type, :null=>false      
      t.string :title, :null=>true, :limit=>100
      t.string :description
      t.string :photo
      t.integer :point, :default => 1
      t.datetime :start_time, :null => true
      t.datetime :end_time, :null => true
      t.timestamps
    end
  end
end




