class AdType < ActiveRecord::Base
  attr_accessible :title, :flag, :file_prefix, :max_file_count
  validates_presence_of :title
  has_many :ad, :dependent=>:destroy
end
