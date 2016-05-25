class CreateQuizLogs < ActiveRecord::Migration
  def change
    create_table :quiz_logs do |t|
      t.references :quizzes
      t.references :quiz_answers
      t.references :users

      t.timestamps
    end
  end
end
