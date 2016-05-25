class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.references :quizzes
      t.string :title, :null => false, :max_legnth => 100

      t.timestamps
    end
  end
end
