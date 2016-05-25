class AdComment < ActiveRecord::Base
  belongs_to :ad
  belongs_to :user
  attr_accessible :id, :ad_id, :user_id, :content
end
