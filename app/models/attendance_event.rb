class AttendanceEvent < ActiveRecord::Base  
  attr_accessible  :title, :flag
  validates_presence_of :title
  mount_uploader :photo, AttendanceUploader
end
