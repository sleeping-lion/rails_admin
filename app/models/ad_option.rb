class AdOption < ActiveRecord::Base
  attr_accessible :web_flag, :web_addr, :web_comment, :callback_flag, :callback_number, :callback_comment, :video_flag, :html_data, :ad_id
  belongs_to :ad, :autosave => true
  accepts_nested_attributes_for :ad, :allow_destroy => true
end
