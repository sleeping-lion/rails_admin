class AdDailyStat < ActiveRecord::Base 
  attr_accessible :week_date , :month_date, :date, :hour, :ad_log_type_id, :ad_id, :log_count, :point_sum
  belongs_to :ad
  belongs_to :ad_log_type
  
  def week_date
    self[:week_date]
  end
  
  def month_date
    self[:month_date]
  end
end
