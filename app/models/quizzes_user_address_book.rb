class QuizzesUserAddressBook < ActiveRecord::Base
  attr_accessible :quiz_id, :user_address_book_id
  validates_presence_of :quiz_id, :user_address_book_id
  validates :quiz_id, :numericality => { :only_integer => true }
  validates :user_address_book_id, :numericality => { :only_integer => true }  
  belongs_to :quiz
  belongs_to :user_address_book
end
