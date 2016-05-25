class AdUser < ActiveRecord::Base
  attr_accessible :ad_id, :user_id, :ad_log_type_id
  belongs_to :ad
  belongs_to :user
  belongs_to :ad_log_type
end
