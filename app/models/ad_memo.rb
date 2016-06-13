class AdMemo < ActiveRecord::Base
  attr_accessible :ad_id, :content
  #validates_presence_of :content
  belongs_to :ad, :autosave=>true
  accepts_nested_attributes_for :ad, :allow_destroy => true
end
