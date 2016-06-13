class AttendanceEventPrize < ActiveRecord::Base
  attr_accessible  :title, :photo, :flag
  belongs_to :attendance
  mount_uploader :photo, AttendanceUploader  
end
