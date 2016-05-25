class QuizLog < ActiveRecord::Base
  attr_accessible :quizzes_id, :quiz_answers_id, :users_id, :created_at
  belongs_to :quiz, :autosave => true
  belongs_to :user, :autosave => true
end
