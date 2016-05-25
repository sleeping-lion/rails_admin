# encoding: utf-8

class RoulettePlaysUserAddressBook < ActiveRecord::Base
  attr_accessible :roulette_play_id, :user_address_book_id
  validates_presence_of :roulette_play_id, :user_address_book_id 
  validates :roulette_play_id, :numericality => { :only_integer => true }
  validates :user_address_book_id, :numericality => { :only_integer => true }  
  belongs_to :roulette_play
  belongs_to :user_address_book
end
