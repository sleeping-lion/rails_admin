# encoding: utf-8

class AdFileType < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
  has_many :ad_file
end
