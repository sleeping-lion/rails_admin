class RequestType < ActiveRecord::Base
  attr_accessible :title, :flag
  validates_presence_of :title
end
