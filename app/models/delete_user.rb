# encoding: utf-8

class DeleteUser < ActiveRecord::Base
  attr_accessible  :id, :username, :nickname, :email, :mobile_num, :nation_num
  validates_presence_of :username, :nickname, :email, :mobile_num, :nation_num 
end