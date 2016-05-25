class QuizAddress < ActiveRecord::Base
  attr_accessible :quiz_logs_id, :address_id, :name, :mobilephone, :address, :user_id
  validates_presence_of :quiz_logs_id, :address_id, :name, :mobilephone, :address
  
  belongs_to :users, :autosave => true
  # belongs_to :roulette_play, :autosave => true  
end