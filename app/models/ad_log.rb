class AdLog < ActiveRecord::Base
  attr_accessible  :id, :ad_id, :user_id, :ad_log_type_id, :point, :clientpoint, :clienttime
  belongs_to :ad
  belongs_to :user
  belongs_to :ad_log_type
end
