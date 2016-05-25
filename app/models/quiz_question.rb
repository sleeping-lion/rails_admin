class QuizQuestion < ActiveRecord::Base
  attr_accessible :id, :quizzes_id, :title, :quiz_answer_attributes
  validates_presence_of :quizzes_id, :title
  belongs_to :quiz, :foreign_key => :quizzes_id, :autosave => true
  has_many :quiz_answer, :foreign_key => :quiz_questions_id, :autosave => true
  accepts_nested_attributes_for :quiz_answer, :allow_destroy => true
end
