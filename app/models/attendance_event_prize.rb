# encoding: utf-8

class AttendancePicture < ActiveRecord::Base
  attr_accessible :attendance_setting_id, :start_date, :title, :flag, :photo, :photo_cache
  validates_presence_of :attendance_setting_id, :start_date, :title
  belongs_to :attendance_setting, :autosave=>true
  mount_uploader :photo, AttendanceUploader  
end
