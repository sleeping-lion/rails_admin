class CreateQuizLogs < ActiveRecord::Migration
  def change
    create_table :quiz_logs do |t|
      t.references :quizzes
      t.references :quiz_answers
      t.references :users
      t.integer :winner_flag, :null => false, :default => 0
      t.timestamps
    end
  end
end
