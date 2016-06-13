class Notice < ActiveRecord::Base
  attr_accessible :id, :title, :flag, :notice_content_attributes
  validates_presence_of :title
  has_one :notice_content, :foreign_key => :id, :dependent => :destroy
  accepts_nested_attributes_for :notice_content, :allow_destroy => true
end
