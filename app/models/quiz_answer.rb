class QuizAnswer < ActiveRecord::Base
  attr_accessible :title, :created_at, :quiz_questions_id, :is_correct
  validates_presence_of :title
  belongs_to :quiz_question, :foreign_key => :quiz_questions_id, :autosave => true
end
