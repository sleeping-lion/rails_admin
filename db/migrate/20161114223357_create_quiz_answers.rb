class CreateQuizAnswers < ActiveRecord::Migration
  def change
    create_table :quiz_answers do |t|
      t.references :quiz_questions
      t.string :title, :null => false, :max_legnth => 100
      t.string :is_correct

      t.timestamps
    end
  end
end
