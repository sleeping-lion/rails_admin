class QuizType < ActiveRecord::Base
  attr_accessible :id, :title, :flag, :transact_type, :created_at
  validates_presence_of :title 
end
