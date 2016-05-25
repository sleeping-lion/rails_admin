class AppLog < ActiveRecord::Base
  belongs_to :app_log_type
  belongs_to :user
  attr_accessible :log_value
end
