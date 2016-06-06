class Quiz < ActiveRecord::Base
  attr_accessible :quiz_type, :title, :photo, :description, :full_description, :budget, :point, :start_time, :end_time,:sponsor, :sponsor_url, :price, :balance, :photo, :photo_cache
  validates_presence_of :title, :description, :budget, :point
  has_many :quiz_question, :foreign_key => :quizzes_id, :dependent => :destroy
  has_many :quiz_log, :foreign_key => :quizzes_id, :dependent => :destroy
  mount_uploader :photo, QuizUploader
end
