class FaqContent < ActiveRecord::Base
  attr_accessible :id, :content
  validates_presence_of :content
  belongs_to :faq, :foreign_key => :id, :autosave=>true
  accepts_nested_attributes_for :faq, :allow_destroy => true
end
