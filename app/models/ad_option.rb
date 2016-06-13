class AdOption < ActiveRecord::Base
  attr_accessible :cpi_flag, :cpi_type, :cpi_market, :cpi_pkg, :cpi_comment, :cpi_publisher, :cpi_apk_size, :cpi_version, :web_flag, :web_addr, :web_comment, :callback_flag, :callback_number, :callback_comment, :video_flag, :html_data, :ad_id, :track_id1, :track_id2
  belongs_to :ad, :autosave => true
  accepts_nested_attributes_for :ad, :allow_destroy => true
end
