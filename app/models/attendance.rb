class Attendance < ActiveRecord::Base
  attr_accessible :attendance_setting_id, :user_id, :count, :flag, :today
  validates_presence_of :attendance_setting_id, :user_id, :today
  belongs_to :user 
end
