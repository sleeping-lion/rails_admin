class AttendanceSetting < ActiveRecord::Base
  attr_accessible  :title, :photo, :attendance_count, :flag
  validates_presence_of :title
  mount_uploader :photo, AttendanceUploader
end
