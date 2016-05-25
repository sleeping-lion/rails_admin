# encoding: utf-8

class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
  attr_accessible :parent_id, :login_id, :nickname, :email, :password, :password_confirmation, :photo, :photo_cache, :flag, :address1, :address2, :tel1, :tel2, :company
  validates_length_of :login_id, :within => 4..40
  mount_uploader :photo, AdminUploader
  
  has_many :roles_admin
  has_many :role, :through=> :roles_admin
  
  nilify_blanks :only => [:parent_id, :nickname, :email]
  
  def role?(role)
    return !!self.role.find_by_title(role)
  end
end
