# encoding: utf-8

class AppVersion < ActiveRecord::Base
  attr_accessible :client_version, :version_name, :contents, :state, :update_date, :flag, :apk_file
  validates_presence_of :client_version
  
  mount_uploader :apk_file, AppVersionUploader

end
