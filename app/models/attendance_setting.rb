class AttendanceSetting < ActiveRecord::Base
  attr_accessible  :title, :flag, :headtext, :prize10, :prize15, :prize20, :prize25, :prize30, :prize5, :photo
  validates_presence_of :title  

  mount_uploader :photo, AttendanceUploader
end
